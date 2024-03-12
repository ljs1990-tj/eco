<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/team_project_style.css">
    <script src="js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <title>레시피 페이지</title>
    <style>
        body, h1, h2, h3, p, ul, li {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            font-size: 24px;
        }

        .recipes-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .recipe {
            width: calc(33.33% - 20px);
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
        }

        .recipe img {
            width: 100%;
            height: auto;
            max-width: 100%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: transform 0.3s;
        }

        .recipe h2 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .recipe p {
            font-size: 14px;
        }

        .recipe:hover img {
            transform: scale(1.1);
        }

        .recipe:hover {
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>
<div id="app">
    <header>
        <h1>UglyUs 레시피</h1>
    </header>

    <section class="recipes-section">
        <div class="recipe" v-for="recipe in recipes">
            <img :src="recipe.imagePath" alt="Recipe Image">
            <h2>{{ recipe.name }}</h2>
            <p>{{ recipe.description }}</p>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 UglyUs. All rights reserved.</p>
    </footer>
</div>

<script>
    var app = new Vue({
        el: '#app',
        data: {
            recipes: []
        },
        mounted() {
            this.fetchRecipes();
        },
        methods: {
            fetchRecipes() {
                this.recipes = [
                    { name: '야채 샐러드', description: '오늘 저녁', imagePath: '../img/recipe1.jpg' },
                    { name: '비건 샐러드', description: '비건 맞음', imagePath: '../img/recipe2.jpg' },
                    { name: '치킨 샐러드', description: '홈파뤼 에피타이저 후기', imagePath: '../img/recipe3.jpg' },
                    { name: '연어 샐러드', description: '연어도 존맛탱', imagePath: '../img/recipe4.jpg' },
                ];
            }
        }
    });
</script>
</body>
</html>