SELECT recipes.description, ingredients.name
    FROM recipes 
    JOIN recipe_ingredients ON recipe_ingredients.recipe_id = recipes.id 
    JOIN ingredients ON ingredients.id = recipe_ingredients.ingredient_id 
    WHERE ingredient_id IN (SELECT id FROM ingredients WHERE name LIKE '%noodles%');


SELECT recipes.id, recipes.description, cuisine.title
    FROM recipes 
     JOIN recipe_cuisine ON recipe_cuisine.recipe_id = recipes.id 
    JOIN cuisine ON cuisine.id = recipe_cuisine.cuisine_id;


SELECT description, recipes.id, title, ARRAY(SELECT ingredients.name FROM recipe_ingredients  
    JOIN ingredients ON ingredients.id = recipe_ingredients.ingredient_id
    WHERE recipe_id = recipes.id) 
    AS ingredient_list FROM recipes
    JOIN recipe_cuisine ON recipe_cuisine.recipe_id = recipes.id 
    JOIN cuisine ON cuisine.id = recipe_cuisine.cuisine_id;


SELECT * FROM all_recipes WHERE 'chilli' = ANY('{chilli}'::text[]);