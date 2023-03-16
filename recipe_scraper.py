from urllib.request import urlopen
from bs4 import BeautifulSoup
from rich.console import Console

console = Console()

BASE_URL = "https://www.bbc.co.uk"

def open_file(url: str):
    with urlopen(url) as page:
        html_bytes = page.read()
        html = html_bytes.decode('utf-8')
        return html
    
def make_soup(url):
    html = open_file(url)
    soup = BeautifulSoup(html, 'html.parser')
    return soup

def get_recipes(soup) -> list:
    recipe_links_html = soup.select('a.promo')
    recipe_links = [recipe.get('href') for recipe in recipe_links_html if "recipes" in recipe.get('href') ]
    return recipe_links

def get_cuisine_recipes(cuisine_type: str) -> list:
    url = BASE_URL+f"/food/cuisines/{cuisine_type}"
    soup = make_soup(url)
    recipe_links = get_recipes(soup)
    return recipe_links

def find_ingredients(recipe_url) -> list:
    soup = make_soup(BASE_URL+recipe_url)
    recipe_name = soup.h1.contents[0]
    ingredients_list_items = soup.select(".recipe-ingredients__list-item")
    ingredients = [ingredient.find('a').contents[0] if ingredient.find('a') else ", ".join(ingredient.contents) for ingredient in ingredients_list_items]
    return recipe_name, ingredients

def shopping_list(cuisine_type: str):
    recipe_links = get_cuisine_recipes(cuisine_type)
    console.print(cuisine_type.capitalize(), style="bold magenta")
    for recipe in recipe_links[0:5]:
        recipe_name, ingredients = find_ingredients(recipe)
        console.print(recipe_name, style="blue")
        console.print(" ,".join(ingredients))

if __name__ == "__main__":
    # shopping_list('chinese')
    cuisines = ['chinese', 'indian', 'british']
    for cuisine in cuisines:
        shopping_list(cuisine)

