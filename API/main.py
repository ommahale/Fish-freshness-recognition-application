from fastapi import FastAPI,UploadFile
from fastapi.middleware.cors import CORSMiddleware

app=FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get('/')
def index():
    return{'message':'This is api'}


@app.post('/upload')
def upload(image:UploadFile):

    return {'label':image.filename}


