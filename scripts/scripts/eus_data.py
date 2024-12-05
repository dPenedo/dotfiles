import datetime


EGUNAK = {
    "Monday": "Astelehena",
    "Tuesday": "Asteartea",
    "Wednesday": "Asteazkena",
    "Thursday": "Osteguna",
    "Friday": "Ostirala",
    "Saturday": "Larunbata",
    "Sunday": "Igandea",
}
HILABETEAK = {
    "January": "Urtarrila",
    "February": "Otsaila",
    "March": "Martxoa",
    "April": "Apririla",
    "May": "Maiatza",
    "June": "Ekaina",
    "Jule": "Uztaila",
    "Agost": "Abuztua",
    "September": "Iraila",
    "October": "Urria",
    "November": "Azaroa",
    "December": "Abendua",
}


def get_date_in_euskera():
    now = datetime.datetime.now()
    day_name = EGUNAK.get(now.strftime("%A"), now.strftime("%A"))
    day_number = now.strftime("%d").lstrip("0")
    month_name = HILABETEAK.get(now.strftime("%B"), now.strftime("%B"))
    year = now.strftime("%Y")

    return f"{year}ko {month_name}rean {day_number}a, {day_name} "


if __name__ == "__main__":
    print(get_date_in_euskera())
