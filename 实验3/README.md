# 实验 3 简单查询

**一、实验目的**

- 了解查询语句的基本格式
- 掌握单表查询的方法
- 掌握分组查询的方法
- 掌握常用聚集函数
- 掌握对查询结果排序的方法

**二、实验环境**

- PC 机（CPU 主频 2.0GHz 以上，4G 以上内存，80GB 以上硬盘空间）
- Win 7 或 Win 10 操作系统
- SQL Server 2008（或以上版本）

**三、实验内容**

数据库 LoanDB 中包含三张关系表，数据模式如下：

| **BankT**  |                                   |                |
| ---------- | --------------------------------- | -------------- |
| **属性名** | **数据类型**                      | **说明**       |
| Bno        | 定长字符串，长度 5                | 银行编号，主键 |
| Bname      | 变长字符串，Unicode 编码，长度 10 | 银行名称       |
| Btel       | 定长字符串，长度 8                | 联系电话       |

| **LegalEntityT** |                                   |                |
| ---------------- | --------------------------------- | -------------- |
| **属性名**       | **数据类型**                      | **说明**       |
| Eno              | 定长字符串，长度 3                | 法人编号，主键 |
| Ename            | 变长字符串，Unicode 编码，长度 15 | 法人名称       |
| Enature          | 定长字符串，Unicode 编码，长度 2  | 经济性质       |
| Ecapital         | 整型                              | 注册资金       |
| Erep             | 变长字符串，Unicode 编码，长度 4  | 法人代表       |

| **LoanT**  |                    |                                         |
| ---------- | ------------------ | --------------------------------------- |
| **属性名** | **数据类型**       | **说明**                                |
| Eno        | 定长字符串，长度 3 | 法人编号，主键，参照关系表 LegalEntityT |
| Bno        | 定长字符串，长度 5 | 银行编号，主键，参照关系关系表 BankT    |
| Ldate      | 时间日期           | 放贷日期，主键                          |
| Lamount    | 整型               | 贷款金额（万元）                        |
| Lterm      | 整型               | 贷款年限                                |

请编写 T-SQL 语句实现以下查询，在 SSMS 中执行，并将查询结果截图：

- 查询所有法人的名称和注册资金
- 查询所有银行的名称和联系电话
- 查询所有银行的全部信息
- 如果所有的贷款利率都为 4.5%，计算所有贷款的还款总额（万元）
- 从贷款表中查询法人代码、银行代码、贷款金额和贷款年份
- 查询注册资金大于 1000 万元的法人名称
- 查询经济性质不为“国营”的法人名称和注册资金
- 查询 2008 年以后的贷款信息
- 查询所有贷款日期为上半年的贷款
- 查询国营和私营单位的法人名称
- 查询非国营和私营单位的法人名称
- 查询注册资金在 600 万元以上（含 600 万元），且经济性质为“三资”或“集体”的法人名称、经济性质和注册资金
- 查询注册资金在 100-600 万元的法人信息
- 查询 2008 年前的大额贷款和小额贷款（大额贷款是指金额大于 1000 万，小额贷款是指金额小于 100 万）
- 查询国营和私营单位的法人名称
- 查询非国营和私营单位的法人名称
- 查询贷款期限为 5、15、25 年的贷款信息
- 查询没有登记电话的银行信息
- 查询所有的交通银行
- 查询法人名称第 2 个字为“美”和“英”的法人信息
- 查询银行电话最后一位不为 3、4、5 的银行信息
- 输出所有银行的信息，记录按银行电话排序
- 输出贷款表中的记录，要求按贷款日期降序排序，同一贷款日期按贷款金额升序排序
- 将 2007、2008 年的贷款按照月份、日期由低到高排序
- 查询贷款表中的所有银行代码
- 查询法人的经济性质有哪几种
- 查询每个法人在哪些银行贷过款，按照法人代码、银行代码排序
- 查询法人代码为“E02”的法人，尚未到期且距离到期时间最短的 2 笔贷款
- 查询已经到期的贷款中贷款期限最长的 2 笔贷款，包括并列的情况
- 统计私营企业的平均注册资金
- 查询银行的总数
- 查询有过贷款记录的法人总数
- 查询“E01”法人的总贷款金额和平均贷款金额
- 查询“B111A”银行的最高贷款金额和最低贷款金额
- 统计各不同经济性质企业的法人数
- 统计每家银行发放贷款的笔数，以及每家银行提供贷款的法人数
- 统计每个法人在每家银行贷款的笔数，输出法人代码、银行代码和贷款笔数
- 输出每家银行在 2005 和 2008 年间每年发放的贷款笔数和平均贷款金额
- 统计银行表中，北京和上海的银行数量
- 统计平均注册资金在 600 万元以上的经济性质类别
- 查询哪些法人的贷款总额在 1 亿以上
- 查询 E01、E02、E03 三家法人的中、短期贷款的贷款笔数，以及贷款总额。中、短期贷款即贷款期限小于 10 年的贷款。输出法人、贷款笔数和贷款总额 3 列
- 查询银行表中北京和上海两地哪些银行的数量大于等于 2，输出城市、银行、数量 3 列
