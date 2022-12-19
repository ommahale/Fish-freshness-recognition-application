from fastapi import FastAPI,UploadFile,File
from fastapi.middleware.cors import CORSMiddleware
import cv2 as cv

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
async def upload(image:UploadFile):
    if image.content_type =='image/jpeg':
        img = cv.imread(image.filename)
        img = cv.resize(img,(416,416), interpolation = cv.INTER_LINEAR)
        return{'Img':img}
    
        
     


