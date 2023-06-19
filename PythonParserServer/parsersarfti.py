from bs4 import BeautifulSoup
import requests
import sqlite3


def parserNews():
    headerList = []
    header_refList = []
    imgList = []
    text_of_articleList = []
    dateList = []
    for i in range(1, 6):
        a = f'https://sarfti.ru/?paged={i}'
        # print(a)
        url = a
        page = requests.get(url)
        # print(page.status_code)
        soup = BeautifulSoup(page.text, "html.parser")
        header, header_ref, img_ref, text_of_article = "", "", "", ""
        allNews = soup.findAll('article', class_='post')
        for _ in allNews:
            # print(_, "\n\n")
            header = _.find('h1').get_text()
            header_ref = _.find('a').get('href')
            date = _.find('time').get_text()
            if _.find('img'):
                img_ref = _.find('img').get('src')
            else:
                img_ref = ""
            if _.find('p'):
                text_of_article = _.find('p').get_text()
            else:
                text_of_article = ""
            text_of_article = text_of_article.replace('\xa0', '').replace('\n', '')
            headerList.append(header)
            header_refList.append(header_ref)
            imgList.append(img_ref)
            text_of_articleList.append(text_of_article)
            dateList.append(date)
    result = [
        {
            'id': i,
            'header': headerList[i],
            'header_ref': header_refList[i],
            'img': imgList[i],
            'text_of_article': text_of_articleList[i],
            'date': dateList[i],
        } for i in range(len(headerList))
    ]
    print("Отправлено на сервер")
    return result
