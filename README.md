# 🚲 Cyclistic Bike-Share: Membership Conversion Analysis

## 📌 Project Overview
This project is part of the **Google Data Analytics Capstone**. It analyzes **5.4 million rows** of historical bike-share data from Cyclistic, a fictional company based in Chicago.

The goal is to uncover behavioral differences between:
- **Annual Members**
- **Casual Riders**

…and use these insights to design strategies that convert casual users into long-term members.


## 🎯 Business Problem

Cyclistic aims to **increase profitability** by converting casual riders into annual members.

### Key Question:
> How do casual riders and annual members use Cyclistic bikes differently, and how can these insights drive conversion strategies?


## 🛠️ Tech Stack

- **Database:** PostgreSQL (Data Cleaning & Analysis)  
- **Visualization:** Power BI (Dashboard & Insights)  
- **Documentation:** Markdown  


## 🧹 Data Preparation (SQL)

A structured cleaning and transformation process was applied:

### ✅ Data Consistency
- Standardized station names using:
  - `TRIM()`
  - `LOWER()`

### 🚫 Outlier Removal
- Removed rides:
  - `< 1 minute` → likely system errors  
  - `> 24 hours` → invalid or stolen bikes  

### ⚙️ Feature Engineering
- Created:
  - `ride_length` (duration)
  - `day_of_week`


## 📊 Key Insights

### 1. Purpose Gap (Usage Behavior)
- **Members:**  
  - Primarily commuters  
  - Peak usage: **Tuesday–Thursday**

- **Casual Riders:**  
  - Leisure-focused  
  - Peak usage: **Weekends**

👉 Indicates fundamentally different usage intent.


### 2. Duration Gap (Engagement Level)
- Casual riders ride **~65% longer**

| User Type | Avg Ride Duration |
|----------|------------------|
| Casual   | ~20 minutes      |
| Members  | ~12 minutes      |

👉 Casual riders exceed cost-efficiency thresholds → strong conversion potential.


### 3. Geographic Divide (Location Behavior)

- **Casual Riders:**
  - Tourist & recreational areas  
  - (e.g., Navy Pier, Museum Campus)

- **Members:**
  - Transit hubs  
  - (e.g., Union Station, Ogilvie)

👉 Location-based targeting = high-impact opportunity.


## 📈 Advanced Analysis

- Identified **high-frequency casual riders** → most likely to convert  
- Found **cost inefficiency** among repeat casual users  
- Detected **weekend repeat behavior** similar to members  

👉 Clear conversion-ready segment exists.


## 💡 Strategic Recommendations

### 🚀 1. Weekend Warrior Campaign
- Target high-traffic weekend stations  
- Promote flexible / weekend memberships  
- Focus on repeat leisure riders  


### 🌱 2. Seasonal Conversion Strategy
- Launch campaigns in **April–May**  
- Capture summer demand early  
- Example: *“Spring Starter Pass”*


### 📍 3. Geo-Targeted Marketing
- Run ads near high casual-usage locations  
- Highlight savings for rides **> 20 minutes**


## 📊 Expected Business Impact

- 📈 Conversion increase: **~3–5% (estimated)**  
- 💰 Higher recurring revenue  
- 📉 Reduced dependency on unpredictable casual users  


## 📉 Dashboard

The Power BI dashboard includes:
- Ride frequency by user type  
- Average ride duration comparison  
- Day-of-week trends  
- Geographic distribution  



## 🧠 Key Takeaway

Casual riders are **not a single group**.

👉 High-frequency weekend users represent the **strongest conversion opportunity**.

Cyclistic should shift from **broad marketing → behavior-based targeting**.


## 🚀 What I Learned

- Translating raw data into business decisions  
- Writing efficient SQL for large-scale datasets  
- Building dashboards that communicate insights clearly  
- Thinking beyond analysis → focusing on **business impact**


## 📌 Future Improvements

- User-level segmentation (if user IDs available)  
- Predictive model for conversion likelihood  
- Pricing sensitivity analysis  


## 👤 Author

**Sudalai Mani S**  
Aspiring Data Analyst  
SQL • Power BI • Business Insights
