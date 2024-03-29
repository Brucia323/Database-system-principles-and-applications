# 实验 8 触发器的应用

**一、实验目的**

- 了解触发器的定义与作用
- 掌握触发器的定义和使用方法
- 熟悉不同类型触发器的特定

**二、实验环境**

- PC 机（CPU 主频 2.0GHz 以上，4G 以上内存，80GB 以上硬盘空间）
- Win 7 或 Win 10 操作系统
- SQLServer 2008（或以上版本）

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
| Eno        | 定长字符串，长度 3 | 银行编号，主键，参照关系表 LegalEntityT |
| Bno        | 定长字符串，长度 5 | 银行编号，主键，参照关系关系表 BankT    |
| Ldate      | 时间日期           | 放贷日期，主键                          |
| Lamount    | 整型               | 贷款金额（万元）                        |
| Lterm      | 整型               | 贷款年限                                |

请按照以下要求编写触发器，并设计测试数据进行测试，将执行结果截图：  
**任务 1：**  
根据新政策要求，银行向“私营”企业提供贷款，其贷款年限不得超过 10 年。请编写触发器，使新插入的贷款记录满足该要求。  
**任务 2：**  
在删除贷款记录时，要将被删除的贷款记录，备份到表 backupLoanT 中。  
**任务 3：**  
在修改贷款记录的金额时，要将修改记录备份到表 modificaitonLamountT 中。该表的结构为：  

| **LoanT**  |                    |                                         |
| ---------- | ------------------ | --------------------------------------- |
| **属性名** | **数据类型**       | **说明**                                |
| Eno        | 定长字符串，长度 3 | 银行编号，主键，参照关系表 LegalEntityT |
| Bno        | 定长字符串，长度 5 | 银行编号，主键，参照关系关系表 BankT    |
| Ldate      | 时间日期           | 放贷日期，主键                          |
| Lterm      | 整型               | 贷款年限                                |
| oldAmount  | 整型               | 原贷款金额（万元）                      |
| newAmount  | 整型               | 修改后的贷款金额（万元）                |

**任务 4：**  
根据新的政策要求，5 万元以下的小额贷款，其贷款年限不能超过 3 年。请编写触发器，使新插入的贷款记录，以及对贷款金额或年限的修改满足该要求。  
**任务 6：**  
创建以下关系表：

| **BankLoanInfoT**       |                            |                                                                                                  |
| ----------------------- | -------------------------- | ------------------------------------------------------------------------------------------------ |
| **属性名**              | **数据类型**               | **说明**                                                                                         |
| Bno                     | 定长字符串，长度 5         | 银行编号，主键                                                                                   |
| LoanNum                 | 整型                       | 提供贷款的次数                                                                                   |
| LoanEno                 | 变长字符串，最大长度为 100 | 贷款对象，以法人代码表示。如果有多个贷款对象，则用逗号间隔。如果没有贷款对象，则取值为空字符串。 |
| 例如：′E01,E02,E09,E10′ |

该关系表记录了每家银行的贷款情况，包括提供贷款的总次数，以及为哪位法人实体提供了贷款。  
请从 LoanT 表中提取数据并计算，并填入该关系表。
