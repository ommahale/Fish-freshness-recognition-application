from fastapi import FastAPI

app=FastAPI()

app=FastAPI()

userInfo={'data':[
        {
            'userID':1,
            'name':'Om'
        },
        {
            'userID':2,
            'name':'Yash'
        },
        {
            'userID':3,
            'name':'Kundan'
        }
    ]}

@app.get('/')
def index():
    return userInfo


