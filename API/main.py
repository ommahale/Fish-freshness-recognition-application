import sys
from fastapi import FastAPI, File, UploadFile
import cv2
import numpy as np
import torch
from yolov5.utils.general import non_max_suppression,scale_boxes
from yolov5.models.experimental import attempt_load

app = FastAPI()

model_file = "best.pt"
device = "cpu"

model = torch.hub.load('ultralytics/yolov5','custom',model_file)
print('hi')
@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    # Read the image file
    contents = await file.read()
    nparr = np.fromstring(contents, np.uint8)
    img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
    img = cv2.resize(img,(414,414))
    results = model(img)
    # print(list(results.pandas()).xyxy)
    print( str(results.pandas().xyxy[0]['name'].value_counts()))
    label=str(results.pandas().xyxy[0]['name'].value_counts())
    if label is None:
        return {"label": "none detected"}
    return {"label": label}
