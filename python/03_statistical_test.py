import pandas as pd
import scipy.stats as stats


# ==========================
# 1. 模拟A/B实验数据
# ==========================

data = {
    "group": [
        "Control",
        "Treatment"
    ],

    "users": [
        50000,
        50000
    ],

    "purchases": [
        2169,
        2401
    ]
}


df = pd.DataFrame(data)


# ==========================
# 2. 计算转化率
# ==========================

df["conversion_rate"] = (
    df["purchases"]
    /
    df["users"]
)


print("\nA/B Test Result")
print(df)


# ==========================
# 3. 两比例Z检验
# ==========================


control = df.iloc[0]

treatment = df.iloc[1]


conversion_control = (
    control["purchases"]
    /
    control["users"]
)


conversion_treatment = (
    treatment["purchases"]
    /
    treatment["users"]
)



# 构造成功失败数量

success = [
    control["purchases"],
    treatment["purchases"]
]


failure = [
    control["users"] - control["purchases"],
    treatment["users"] - treatment["purchases"]
]


# 卡方检验（适合二分类转化）

chi2, p_value, _, _ = stats.chi2_contingency(
    [
        success,
        failure
    ]
)


print("\nStatistical Test")

print(
    "Chi-square:",
    round(chi2,4)
)


print(
    "p-value:",
    round(p_value,6)
)



# ==========================
# 4. Lift计算
# ==========================


lift = (
    conversion_treatment
    -
    conversion_control
) / conversion_control


print(
    "\nConversion Lift:"
)

print(
    round(lift*100,2),
    "%"
)



# ==========================
# 5. 业务结论
# ==========================


alpha = 0.05


print("\nConclusion")


if p_value < alpha:

    print(
        "实验结果具有统计显著性，新版本建议上线"
    )

else:

    print(
        "实验结果没有达到统计显著性，需要继续实验"
    )

df.to_csv(
    "../report/ab_test_result.csv",
    index=False
)

print("Result saved!")