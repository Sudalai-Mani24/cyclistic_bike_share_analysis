🚲 Cyclistic Bike-Share: Membership Conversion Analysis
 Project Overview

This project is part of the Google Data Analytics Capstone and focuses on analyzing 5.4 million rows of historical bike-share data from Cyclistic, a fictional company based in Chicago.

The primary business objective is to understand behavioral differences between Annual Members and Casual Riders and develop data-driven strategies to convert casual users into long-term members.

 Business Problem

Cyclistic aims to increase profitability by converting casual riders into annual members.

Key Question:

How do casual riders and annual members use Cyclistic bikes differently, and how can these insights drive conversion strategies?

Tech Stack

Database: PostgreSQL (Data Cleaning & Analysis)

Visualization: Power BI (Dashboard & Insights)

Documentation: Markdown

 Data Processing (Prepare Phase)

A structured data cleaning process was performed using SQL:

Data Consistency:

Standardized station names using TRIM() and LOWER()

Outlier Removal:

Removed rides < 1 minute (system errors)

Removed rides > 24 hours (invalid or stolen bikes)

Feature Engineering:

Created ride_length (duration)

Extracted day_of_week

📊 Key Insights
1. Purpose Gap (Usage Behavior)

Members: Primarily commuters

Peak usage: Tuesday–Thursday

Casual Riders: Leisure-focused

Peak usage: Weekends

👉 Indicates fundamentally different usage intent.

2. Duration Gap (Engagement Level)

Casual riders ride ~65% longer

Casual: ~20 minutes

Members: ~12 minutes

👉 Casual riders exceed cost-efficiency thresholds, making them strong candidates for membership conversion.

3. Geographic Divide (Location Behavior)

Casual Riders:

Cluster around tourist & recreational areas

(e.g., Navy Pier, Museum Campus)

Members:

Concentrated near transit hubs

(e.g., Union Station, Ogilvie)

👉 Location-based targeting is a high-impact opportunity.

📈 Advanced Analysis

To move beyond descriptive insights, additional behavioral patterns were evaluated:

High-Frequency Casual Riders Identified
→ Most likely segment to convert

Cost Efficiency Gap
→ Frequent casual riders spend more than a membership would cost

Conversion Opportunity
→ Riders with repeated weekend usage show behavior closest to members

💡 Strategic Recommendations
1. Weekend Warrior Campaign

Target high-traffic weekend stations

Promote flexible or weekend-only memberships

Focus on riders with repeated leisure usage

2. Seasonal Conversion Strategy

Launch “Spring Starter” campaigns (April–May)

Capture high-volume summer casual riders early

3. Geo-Targeted Marketing

Deploy digital ads near top casual rider locations

Highlight cost savings for rides >20 minutes

📊 Expected Business Impact

Targeting top casual rider segments could:

Increase conversion rates by ~3–5% (estimated)

Improve recurring revenue through memberships

Reduce dependency on unpredictable casual usage

📉 Dashboard

The Power BI dashboard includes:

Ride frequency by user type

Average ride duration comparison

Day-of-week usage trends

Geographic distribution of riders

(Add screenshot here)

🧠 Key Takeaway

Casual riders are not a single group—high-frequency weekend users represent the strongest conversion opportunity.

Cyclistic should prioritize behavior-based segmentation and targeted marketing, rather than broad campaigns, to maximize membership growth.

🚀 What I Learned

Translating raw data into business decisions

Using SQL for large-scale data cleaning and transformation

Designing dashboards to communicate insights effectively

Thinking beyond analysis → focusing on impact and strategy

📌 Future Improvements

User-level segmentation (if user IDs available)

Predictive model for conversion likelihood

Pricing sensitivity analysis

👤 Author

Sudalai Mani S
Aspiring Data Analyst | SQL • Power BI • Business Insights
