from api_db import db_connect, insert
from recipe_scraper import get_cuisine_recipes, find_ingredients

def populate_recipes(recipe_title, connection):
    try:
        query = """INSERT INTO recipes (description) VALUES (%s) 
                ON CONFLICT (description) DO NOTHING 
                RETURNING id;"""
        query_res = insert(query, (recipe_title,), connection=connection)
        return query_res[0]
    except:
        raise Exception("Error inserting recipes")

def populate_cuisines(cuisine, connection):
    try:
        query = """WITH ins AS (
                INSERT INTO cuisine (title) VALUES (%s) 
                ON CONFLICT (title) DO NOTHING 
                RETURNING id)
            SELECT id FROM ins 
            UNION ALL 
            SELECT id FROM cuisine 
            WHERE title = %s;"""
        query_res = insert(query, (cuisine, cuisine), connection=connection)
        return query_res[0]
    except:
        raise Exception("error inserting cuisine")

def populate_recipe_ingredients(recipe_ingredients, connection):
    try:
        records_list_template = ','.join(['%s'] * len(recipe_ingredients))
        query = f"""INSERT into recipe_ingredients (recipe_id, ingredient_id) 
                        VALUES {records_list_template} 
                    RETURNING recipe_id, ingredient_id;"""
        query_res = insert(query, recipe_ingredients, connection)
        return query_res
    except:
        raise Exception("Error populating recipe/ingredients table")

def populate_ingredients(ingredient, connection):
    try:
        query = """WITH ins AS (
                INSERT INTO ingredients (name) VALUES %s 
                ON CONFLICT (name) DO NOTHING 
                RETURNING ID)
            SELECT id FROM ins 
            UNION ALL 
            SELECT id FROM ingredients 
            WHERE name LIKE %s;"""
        query_res = insert(query, ((ingredient,), ingredient), connection=connection)
        return query_res
    except:
        raise Exception("Error inserting recipes")

def populate_recipe_cuisines(recipe_ids, cuisine_id, connection):
    try:
        cuisine_recipes = [(id, cuisine_id) for id in recipe_ids]
        records_list_template = ','.join(['%s'] * len(cuisine_recipes))
        query = f"""INSERT INTO recipe_cuisine (recipe_id, cuisine_id) 
                        VALUES {records_list_template} 
                    RETURNING recipe_id, cuisine_id;"""
        insert(query, cuisine_recipes, connection)
    except:
        raise Exception("Error adding recipe/cuisines")

def get_ingredient_ids(ingredients):
    ingredient_ids = []
    for ingredient in ingredients:
        id = populate_ingredients(ingredient, connection)
        ingredient_ids.append(id)
    return ingredient_ids

def add_recipe_data(recipe_links, connection):
    recipe_ids = []
    for recipe in recipe_links[0:20]:
        recipe_name, ingredients = find_ingredients(recipe)
        recipe_id = populate_recipes(recipe_name, connection)
        recipe_ids.append(recipe_id)
        ingredient_ids = get_ingredient_ids(ingredients)
        ingredient_recipe_ids = [(recipe_id, id) for id in ingredient_ids]
        populate_recipe_ingredients(ingredient_recipe_ids, connection)    
    return recipe_ids


if __name__ == "__main__":
    cuisines = ['chinese', 'indian', 'british']
    with db_connect() as connection:
        for cuisine in cuisines:
            cuisine_id = populate_cuisines(cuisine.capitalize(), connection)
            recipe_links = get_cuisine_recipes(cuisine)
            recipe_ids = add_recipe_data(recipe_links, connection)
            populate_recipe_cuisines(recipe_ids, cuisine_id, connection)
    

