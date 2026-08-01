import pandas as pd


# 读取实验数据
df = pd.read_csv(
    "../report/ab_test_data.csv"
)


# 用户数
users = df.groupby("group")["user_id"].count()


# 购买人数
purchases = df.groupby("group")["purchase"].sum()


# 转化率
conversion_rate = purchases / users


result = pd.DataFrame({

    "Users": users,

    "Purchases": purchases,

    "Conversion_Rate": conversion_rate

})


# 百分比格式
result["Conversion_Rate"] = (
    result["Conversion_Rate"] * 100
).round(2)


print(result)


# 计算提升比例

lift = (

conversion_rate["Treatment"]

-

conversion_rate["Control"]

) / conversion_rate["Control"] * 100


print("\nConversion Lift:")
print(round(lift,2),"%")