from fastapi import FastAPI
import sqlite3
from parsersarfti import *

app = FastAPI()


@app.get("/getNews")
async def news():
    return parserNews()

