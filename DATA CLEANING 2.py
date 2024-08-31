#!/usr/bin/env python
# coding: utf-8

# In[3]:


import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt


# In[5]:


df = pd.read_csv(r"C:\Users\Bapela Kanyane\Downloads\layoffs.csv")
df


# In[7]:


df.info()


# In[8]:


df.duplicated().sum()


# In[9]:


df = df.drop_duplicates()
df


# In[10]:


df.company.unique()


# In[11]:


df.industry.unique()


# In[12]:


df["industry"]=df["industry"].str.replace("Crypto Currency","Crypto")
df["industry"]=df["industry"].str.replace("CryptoCurrency","Crypto")


# In[13]:


df.industry.unique()


# In[14]:


df.stage.unique()


# In[15]:


df.country.unique()


# In[16]:


df["country"]=df["country"].str.replace("United States.","United States")
df


# In[17]:


df.country.unique()


# In[18]:


df.dtypes


# In[19]:


df["date"] = pd.to_datetime(df["date"])


# In[20]:


df.dtypes


# In[21]:


df


# In[22]:


df.isnull().sum()


# In[23]:


df.describe()


# In[24]:


df.corr()


# In[25]:


df


# In[26]:


df.dropna(subset=['total_laid_off','percentage_laid_off'], how='all', inplace= True)
df


# In[27]:


df.isnull().sum()


# In[28]:


df.fillna({'industry':df['industry'].mode()[0],
         'stage':df['stage'].mode()[0],
          'total_laid_off':df['total_laid_off'].mean(),
          'percentage_laid_off':df['percentage_laid_off'].mean(),
          'funds_raised_millions':df['funds_raised_millions'].mean()}, inplace= True)


# In[29]:


df.isnull().sum()


# In[30]:


df.fillna(method = 'ffill', inplace = True)


# In[31]:


df.isnull().sum()


# In[32]:


df.to_excel("C:\\Users\\Bapela Kanyane\\Documents\LayoffsCleaned.xlsx")


# In[ ]:




