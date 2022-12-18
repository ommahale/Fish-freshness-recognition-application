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
async def upload(image:UploadFile):
    image.file.seek(0)
    image_byte_data=await image.file.read()
    image.file.close()
    
    
    #The data recived from the post request is stored in UTF-8 byte encoded format in image_byte_data variable
    #Decode the image_byte_data for futer operations


    return {'label':image.filename}


