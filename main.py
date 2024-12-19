from fastapi import FastAPI

from config import database


from routes.user import user
from models.blog import SignUpUser,DetailsSender,DetailsRecevier,Order,TrackingOrder,ReviewDetails,SignupAdmin,SignupDeliveryPerson,OTPMessage
from config import database

from fastapi.middleware.cors import CORSMiddleware

from config.database import engine

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
app.include_router(user)
database.Base.metadata.create_all(bind=engine)

