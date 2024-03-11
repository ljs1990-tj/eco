package com.example.test1.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/kakaoLogin.do")
    public class KakaoController {
        //redirect uri에 전달된 코드 값을 가지고 Access Token을 요청한다.
        @GetMapping
        public String getAccessToken(@RequestParam("code") String code) {
            System.out.println("code = " + code);

            // 1. header 생성
            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.add(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8");

            // 2. body 생성
            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            params.add("grant_type", "authorization_code"); 
            params.add("client_id", "d806de64224ad3190e9f1f718ee4ec75");
            params.add("redirect_uri", "http://localhost:8080/kakaoLogin.do");
            params.add("code", code);

            // 3. header + body
            HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(params, httpHeaders);

            // 4. http 요청하기
            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<Object> response = restTemplate.exchange(
                    "https://kauth.kakao.com/oauth/token",
                    HttpMethod.POST,
                    httpEntity,
                    Object.class
            );
            System.out.println("response = " + response);
            System.out.println("responseBody = " + response.getBody());
            HashMap<String, Object> map = (HashMap<String, Object>) response.getBody();
            getUserInfo((String)map.get("access_token"));

            return "main";
        }
        
        public HashMap<String, Object> getUserInfo(String accessToken) {
            HashMap<String, Object> userInfo = new HashMap<>();
            String reqUrl = "https://kapi.kakao.com/v2/user/me";
            try{
                URL url = new URL(reqUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Authorization", "Bearer " + accessToken);
                conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

                int responseCode = conn.getResponseCode();
            //    log.info("[KakaoApi.getUserInfo] responseCode : {}",  responseCode);

                BufferedReader br;
                if (responseCode >= 200 && responseCode <= 300) {
                    br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                } else {
                    br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                }

                String line = "";
                StringBuilder responseSb = new StringBuilder();
                while((line = br.readLine()) != null){
                    responseSb.append(line);
                }
                String result = responseSb.toString();
            //    log.info("responseBody = {}", result);

                JsonParser parser = new JsonParser();
                JsonElement element = parser.parse(result);

                JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
                JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

                String nickname = properties.getAsJsonObject().get("nickname").getAsString();

                userInfo.put("nickname", nickname);
          //      userInfo.put("email", email);
                System.out.println(nickname);
                br.close();

            }catch (Exception e){
                e.printStackTrace();
            }
            return userInfo;
        }
    }
