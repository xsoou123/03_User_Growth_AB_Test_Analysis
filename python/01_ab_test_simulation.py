import pandas as pd
import numpy as np


# 设置随机种子，保证结果复现
np.random.seed(42)


# 用户数量
users = 50000


# 创建实验数据

data = pd.DataFrame({

    "user_id": range(1, users * 2 + 1),

    "group":
    ["Control"] * users +
    ["Treatment"] * users

})


# 模拟购买行为

control_purchase = np.random.binomial(
    1,
    0.044,
    users
)


treatment_purchase = np.random.binomial(
    1,
    0.050,
    users
)


data["purchase"] = np.concatenate(
    [
        control_purchase,
        treatment_purchase
    ]
)


print(data.head())


# 保存实验数据

data.to_csv(
    "../report/ab_test_data.csv",
    index=False
)


print("A/B test data generated successfully!")