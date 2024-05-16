from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time


with open("datos.txt", "r") as file: 
    lines = file.readlines()
    user_linke = lines[0].strip()
    contra_linke = lines[1].strip()

driver = webdriver.Chrome() 
driver.get("https://www.linkedin.com/login/")


username_field = driver.find_element(By.NAME, "session_key")
password_field = driver.find_element(By.NAME, "session_password")
username_field.send_keys(user_linke)
password_field.send_keys(contra_linke)

password_field.send_keys(Keys.RETURN)

# Esperar unos segundos para que la página se cargue completamente
time.sleep(200)  # Puedes ajustar el tiempo de espera según sea necesario

# Cerrar el navegador
driver.quit()