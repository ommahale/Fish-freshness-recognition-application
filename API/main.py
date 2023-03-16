import io
from fastapi import FastAPI,UploadFile,File
from fastapi.middleware.cors import CORSMiddleware
from PIL import Image
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
async def upload(image:UploadFile=File(...)):
        contents = await image.read()
        image = Image.open(io.BytesIO(contents))
        image_width = image.size[0]
        image_height = image.size[1]
        return{"label":""}
    
        
     


