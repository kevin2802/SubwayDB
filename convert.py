import pandas as pd
df = pd.read_csv('Trains.csv')
df['subcategory'].fillna("not specified",inplace=True)
df['month'] = pd.to_datetime(df['month'])
#convert month to datetime
df.to_csv('newTrains.csv',index=False)
