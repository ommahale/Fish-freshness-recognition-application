# Fish-freshness-recognition-application
 Firsh freshness detection application using yolo V2 and Flutter

## Prerequisites:
 * Flutter 
 * FastAPI
 * Tensorflow

## Project Structure:
 This project has two directories:
 1. *Application:* Here all the files for flutter native application are stored. In order to run the application type `flutter run` in terminal while being in the aqua-vision directory and with appropriate simulator/emulator/USB-debugging configured 
 2. *API:* Here all the files for API are stored. In order to run the API first install al the packages in [requiremets.txt](https://github.com/ommahale/Fish-freshness-recognition-application/blob/main/API/requirements.txt). Now in the API directory type `uvicorn main:app --reload` in terminal. Now the API is up and running. In order to access it simply open the [localhost:8000](http://localhost:8000) in your browser. In order to access API through Swagger UI open [localhost:8000/docs](http://localhost:8000/docs)
