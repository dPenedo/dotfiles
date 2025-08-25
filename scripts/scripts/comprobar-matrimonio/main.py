from typing import Optional
from bs4 import BeautifulSoup, Tag
import requests

link: str = "https://www.cgeonline.com.ar/informacion/apertura-de-citas.html"
text_to_find: str = "Registro Civil-Matrimonios"
last_date: str = "30/07/2025"
title: Optional[str] = None

try:
    with requests.get(link) as response:
        response.raise_for_status()  # Lanza error si no hay 200
        soup: BeautifulSoup = BeautifulSoup(response.text, "html.parser")

        tag_with_text: Optional[Tag] = soup.find("td", string=text_to_find)

        if tag_with_text is not None:
            row: Optional[Tag] | None = tag_with_text.parent
            if row:
                cols = row.find_all("td")
                for col in cols:
                    print("-----> ", col.text)
                print("-" * 30)
                date: str = cols[1].text.strip()
                if last_date != date:
                    print("X" * 50)
                    print("La fecha cambió! hay que ir a ")
                    print("X" * 50)
                    a_tag: Optional[Tag] = cols[3].find("a")
                    if a_tag:
                        link = a_tag.get("href").strip()
                        print(f"https://www.cgeonline.com.ar{link}")

                else:
                    print("La fecha sigue siendo ", date)
        else:
            print(f"No se encontró el texto: {text_to_find}")

except requests.RequestException as e:
    print("Error en la petición:", e)
except Exception as e:
    print("Error inesperado:", e)
