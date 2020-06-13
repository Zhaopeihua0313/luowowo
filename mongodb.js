/*
 Navicat Premium Data Transfer

 Source Server         : JavaMongoDB
 Source Server Type    : MongoDB
 Source Server Version : 40005
 Source Host           : localhost:27017
 Source Schema         : luowowo

 Target Server Type    : MongoDB
 Target Server Version : 40005
 File Encoding         : 65001

 Date: 29/11/2019 19:00:09
*/


// ----------------------------
// Collection structure for answer
// ----------------------------
db.getCollection("answer").drop();
db.createCollection("answer");

// ----------------------------
// Documents of answer
// ----------------------------
db.getCollection("answer").insert([ {
    _id: ObjectId("5dd945058f4d0000d600695e"),
    questionId: NumberLong("1"),
    coverUrl: "/703b33e6-7cdf-4ca6-b380-793fdadcbeeb.png",
    summary: "需要口罩",
    authorId: NumberLong("2"),
    authorname: "bunny",
    level: NumberInt("1"),
    headUrl: "/images/default.png",
    creatTime: ISODate("2019-11-15T06:45:20.977Z"),
    content: "不到长城非好汉",
    golden: true,
    thumbupNum: NumberInt("17"),
    shareNum: NumberInt("0"),
    thumbuplist: [
        NumberLong("1"),
        NumberLong("2")
    ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5dd948648f4d0000d600695f"),
    questionId: NumberLong("2"),
    coverUrl: "/703b33e6-7cdf-4ca6-b380-793fdadcbeeb.png",
    summary: "拉萨有布达拉宫",
    authorId: NumberLong("2"),
    authorname: "bunny",
    level: NumberInt("1"),
    headUrl: "/images/default.png",
    creatTime: ISODate("2019-11-15T06:45:20.977Z"),
    content: "其实并非如此，高反只是一种身体反应，并不是一种病，也不是什么可怕的东西。仅仅是一种反应而已，因为西藏地处高原，海拔高，空气稀薄，气压低。身体不适应，就会有高反。并且这个反应，只会在第一天的时候特别明显，只要第一天的第一个晚上，休息好，别乱动，多喝水。第二天起来，你就又生龙活虎了。",
    golden: true,
    thumbupNum: NumberInt("2"),
    thumbuplist: [
        NumberLong("1"),
        NumberLong("2")
    ],
    shareNum: 0
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddb52d9095dc7811413cac1"),
    questionId: NumberLong("1"),
    coverUrl: "78cad2a5-e696-4b77-95b2-918b45f30874.png",
    summary: "颐和园：坐落在北京西郊，是中国清朝时期皇家园林，前身为清漪园，它是以昆明湖、万寿山为基址，以杭州西湖...",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-25T04:04:41.351Z"),
    content: "颐和园：坐落在北京西郊，是中国清朝时期皇家园林，前身为清漪园，它是以昆明湖、万寿山为基址，以杭州西湖为蓝本，汲取江南园林的设计手法而建成的一座大型山水园林，也是保存最完整的一座皇家行宫御苑，被誉为“皇家园林博物馆”，也是国家重点旅游景点属于5A景区，非常适合和家人前往游玩。这里开放时间是：6:30—18:00（大门开放时间），门票是：30元/张（旺季），20元/张（淡季）学生票半价，在这里可以很好的了解皇家园林的建筑和历史，丰富自己的见识和了解文化底蕴。",
    golden: false,
    thumbupNum: NumberInt("2"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddb598b095dc72e18c6bc75"),
    questionId: NumberLong("32"),
    coverUrl: "3c714ccb-51cc-42eb-b47f-d07ac486e488.png",
    summary: "江户时代,剧场幕间(休息时间)吃的盒饭,所以被称为幕内盒饭.它是将四季的食物材料做成量小而丰富多样的...",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-25T04:33:15.156Z"),
    content: "江户时代,剧场幕间(休息时间)吃的盒饭,所以被称为幕内盒饭.它是将四季的食物材料做成量小而丰富多样的菜,然后拼在饭盒里,使它看起来悦目,吃起来味美.这种日本特有的盒饭,无论是在日本料理店，还是在盒饭屋、车站盒饭 屋，都是最受欢迎的",
    golden: true,
    thumbupNum: NumberInt("0"),
    thumbuplist: [ ],
    shareNum: 0
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddb5c79095dc72e18c6bc76"),
    questionId: NumberLong("32"),
    coverUrl: "ab697354-7a24-4ba9-98f8-94963214a753.png",
    summary: "关东地区的“江户前寿司”是将洒上醋的米饭捏成一口能吃下的饭团，然后抹上绿芥末（芥末有黄绿之分），再放...",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-25T04:45:45.447Z"),
    content: "关东地区的“江户前寿司”是将洒上醋的米饭捏成一口能吃下的饭团，然后抹上绿芥末（芥末有黄绿之分），再放上新鲜的生鱼片。在海产品丰富的日本各地都能吃到。在关西地方，是将加入调料的鱼和洒上醋的饭放入模具中挤压，做成挤压寿司，这种寿司自古就有，还有回转寿司",
    golden: false,
    thumbupNum: NumberInt("0"),
    thumbuplist: [ ],
    shareNum: 0
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddb6c318e7f000095007902"),
    questionId: NumberLong("1"),
    coverUrl: "/703b33e6-7cdf-4ca6-b380-793fdadcbeeb.png",
    summary: "天坛是个值得一去的地方",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-15T06:45:20.977Z"),
    content: "天坛是个值得一去的地方,会让你感觉到神秘",
    golden: false,
    thumbupNum: NumberInt("3"),
    shareNum: NumberInt("0"),
    thumbuplist: [
        NumberLong("1")
    ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddd1305095dc7ec782503f4"),
    questionId: NumberLong("1"),
    summary: "啊",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-26T11:56:48.445Z"),
    content: "啊",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddd1357095dc7ec782503f5"),
    questionId: NumberLong("1"),
    summary: "啊啊",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-26T11:58:15.222Z"),
    content: "啊啊",
    golden: false,
    thumbupNum: NumberInt("1"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5dddedd7095dc7ac7cfd5bc5"),
    questionId: NumberLong("35"),
    coverUrl: "197e2c8b-2bd5-40eb-8e34-703e02981a27.jpg",
    summary: "北京市，简称“京”，是中华人民共和国首都、也是中国4个直辖市之一；北京是国家中心城市、超大城市，全国...",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-27T03:30:31.04Z"),
    content: "北京市，简称“京”，是中华人民共和国首都、也是中国4个直辖市之一；北京是国家中心城市、超大城市，全国政治中心、文化中心、国际交往中心、科技创新中心，是世界著名古都和现代化国际城市，也是中国共产党中央委员会、中华人民共和国中央人民政府和全国人民代表大会常务委员会的办公所在地",
    golden: true,
    thumbupNum: NumberInt("1"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5dddf146095dc7d1e05403cb"),
    questionId: NumberLong("39"),
    coverUrl: "208fa23c-2903-49c6-8c49-cb46473cf49d.jpeg",
    summary: "北京被世界权威机构GaWC评为世界一线城市 [6]  。截至2018年末，北京市常住人口2154.2...",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    creatTime: ISODate("2019-11-27T03:45:10.195Z"),
    content: "北京被世界权威机构GaWC评为世界一线城市 [6]  。截至2018年末，北京市常住人口2154.2万人，实现地区生产总值（GDP）30320亿元，人均地区生产总值实现14万元 [7-8]  。社会消费品零售总额11747.7亿元，批发业销售额57383.1亿元，人均可支配收入62361元，住户存款总额32507.8亿元，高新技术企业总数24691家 [9-10]  。联合国报告指出北京人类发展指数居中国城市第二位",
    golden: true,
    thumbupNum: NumberInt("1"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5dde9bc65c972e5e1cdb9fba"),
    questionId: NumberLong("54"),
    summary: "打算打打打",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    creatTime: ISODate("2019-11-28T05:26:36.478Z"),
    content: "打算打打打",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5dde9bcd5c972e5e1cdb9fbb"),
    questionId: NumberLong("54"),
    summary: "打算打打打算的",
    authorId: NumberLong("1"),
    authorname: "逍遥",
    level: NumberInt("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    creatTime: ISODate("2019-11-27T15:52:45.064Z"),
    content: "打算打打打算的",
    golden: true,
    thumbupNum: NumberInt("2"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf306c5c972e85a003402d"),
    questionId: NumberLong("58"),
    coverUrl: "3a89c4c1-dfdf-4656-9169-a6508212d874.jpg",
    summary: "今天就跟大家分享一下我的泸沽湖的行程，富含大量泸沽湖旅游攻略信息，要好好看完哟哈哈！最初知道泸沽湖是...",
    authorId: NumberLong("21"),
    authorname: "小龙女",
    level: NumberInt("1"),
    creatTime: ISODate("2019-11-28T02:26:52.886Z"),
    content: "今天就跟大家分享一下我的泸沽湖的行程，富含大量泸沽湖旅游攻略信息，要好好看完哟哈哈！最初知道泸沽湖是几年前来丽江了解行程路线时，旅行社工作人员介绍的。说那里是，中国的女儿国。女人真正当家做主的地方。\n摩梭人认为母为尊，女为贵，母亲是摩梭人生活中的轴心和靠山，摩梭人离不开母亲，离不开以母亲为主的家屋，女性在母系家屋中享有尊贵的地位。\n泸沽湖一定要找个最美的季节来\n泸沽湖的行程一般都是：游湖——游船——走婚桥——感受摩梭文化，大致就是这样。\n泸沽湖位于宁蒗县北部永宁乡和四川省盐源县左侧的万山丛中，距丽江古城200公里左右，为川滇两省界湖，一半四川一半云南 ，环湖一圈车程70公里。",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf31585c972e85a003402e"),
    questionId: NumberLong("59"),
    coverUrl: "98b8b100-c51f-42ca-8a1c-9a2672a960d9.jpg",
    summary: "7:30乘车前往原始森林，在天然森林浴场来个清晨spa，呼吸芬芳潮湿的空气，脚踩柔软深厚的苔藓和落叶...",
    authorId: NumberLong("22"),
    authorname: "八仙",
    level: NumberInt("1"),
    headUrl: "/qaz12.jpg",
    creatTime: ISODate("2019-11-28T02:30:48.485Z"),
    content: "7:30乘车前往原始森林，在天然森林浴场来个清晨spa，呼吸芬芳潮湿的空气，脚踩柔软深厚的苔藓和落叶，伴随阵阵松涛和鸟语……（50分钟，沿栈道环绕原始森林步行）\n8:20乘车至竹影摇曳的箭竹海，在绝美画面中回顾电影《英雄》中的刀光剑影、爱恨情仇，情侣、新婚夫妇合影最佳地——箭竹海瀑布。（40分钟，沿栈道步行） 9:00波光山影的熊猫海，蓝天白云下，湖水清澈湛蓝，倒影迷离，亦真亦幻。运气好的话，可以看到可爱的大熊猫来这里喝水游荡。沿栈道走入九寨沟落差最大的熊猫海瀑布，在乡野风格的观景台上欣赏气势如虹的激流。（30分钟，沿栈道步行）\n9:30九寨最艳丽的海子五花海，一湖中宝蓝、翠绿、橙黄、浅红，似无数块宝石镶嵌，在阳光的照射下彩波粼粼，绮丽无比。摄影提示：绕过五花海的西侧，有一段栈道是欣赏五花海美景的绝佳点。（30分钟，从熊猫海沿栈道穿过海子到公路上步行，可感受穿越海子，返回栈道前往孔雀河道）\n10:0010：00 蜿蜒入森林的孔雀河道，两岸花树杂生，鸟鸣清脆，水流颜色极为丰富，波涌浪澜时，宛如孔雀开屏，美艳无比。最佳拍摄点：在一处几米长的木桥上，湍急的水流在这里激起漩涡，正好形成了美丽的孔雀图案。（30分钟，沿栈道步行）\n10:30进入九寨沟绝景之一的珍珠滩了，滩面大量的藻类和星罗棋布的喜水灌丛，清澈的激流在滩面溅起无数碎浪，在阳光下似颗颗滚动的珍珠。传说在此许愿多半会实现，只要你一踏上珍珠滩栈道就不要回头，直到走完栈道，表明旅途圆满。（30分钟，沿栈道步行）\n11:20镜海的倒影独霸九寨沟。似镜子将天地毫不失真地复制到水里，蓝天、白云、雪山被收入海底，形成”鱼在云中游，鸟在水中飞“的奇特景观。（30分钟，沿栈道步行）\n11:20镜海的倒影独霸九寨沟。似镜子将天地毫不失真地复制到水里，蓝天、白云、雪山被收入海底，形成”鱼在云中游，鸟在水中飞“的奇特景观。（30分钟，沿栈道步行）",
    golden: true,
    thumbupNum: NumberInt("1"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf318d5c972e85a003402f"),
    questionId: NumberLong("58"),
    coverUrl: "6891b4ed-55b0-4449-be69-44c12d66d6ae.jpg",
    summary: "该预订的都齐了，接下来就该准备行李了。本次出游本人总结了如下装备，您可以根据实际情况增减：\n衣服：羽...",
    authorId: NumberLong("22"),
    authorname: "八仙",
    level: NumberInt("1"),
    headUrl: "/qaz12.jpg",
    creatTime: ISODate("2019-11-28T02:31:41.053Z"),
    content: "该预订的都齐了，接下来就该准备行李了。本次出游本人总结了如下装备，您可以根据实际情况增减：\n衣服：羽绒服（12月去丽江必备）、手套（爬雪山、泸沽湖骑车环湖）、保暖内衣、毛衣、帽子（遮阳和保暖各一顶）、运动鞋、马丁靴/雪地靴、运动裤\n防晒：墨镜（必备必备！）、高倍防晒霜（每天出行必抹）、披肩（可到丽江购买，又美丽又实用）鸭舌帽\n护肤品：保湿水乳霜、补水面膜（白天很干）、护唇膏、护手霜\n其他：保温水杯（随身携带）、手电筒、内存卡、双肩包、手提包（千万不要用拉杆箱，会死的很惨）药（感冒药、肠胃药、创可贴）蜂蜜（排毒神器）\n之前准备坐车整理的交通攻略分享一下：\n以前从丽江去泸沽湖坐汽车走崎岖的山路要走6、7个小时的路程，非常难熬，如今新路开通，只需要4个小时即可达到。\n第一种办法你可以在丽江客运站乘坐大巴，从丽江直接前往泸沽湖，每天早上9∶00和10∶00有两班巴士，；路线为丽江客运站－泸沽湖客运站（大落水村）；如果从泸沽湖返回丽江，需要到泸沽湖客运站（大落水村）订票，泸沽湖各个客栈也提供免费代订服务，每天上午有两趟车，分别是10：00和12：00。\n第二种办法是乘坐泸沽湖旅游专线车，19座左右车型，往返票价140元，途经大落水村，最后停泊在里格村，每天早上07：40到古城大水车接人，或者08：30在古城停车场发车。\n第三种办法是乘坐丽江客运站丽江至西昌的班车，经过大落水停。\n第四种办法是先到宁蒗县城，再到泸沽湖大落水。丽江客运站有很多到宁蒗的班车，而丽江的慢节奏在发车时间上也有体现，最早的一班车在早上7∶30才发车，下午3∶00则是最后一班车了，全天10辆班车，票价25元/人。路况不是特别好，125千米的路程要用4个小时才能开到。\n第五种办法是从报团，一定要报纯玩团，不要试图贪便宜，跟团游其实很适合第一次去泸沽湖的朋友，路线交通不熟悉的情况下，千万不要自驾去，丽江到泸沽湖山路十八弯，雨季很危险：带小孩老人的也建议报团，这样能省去很多不必要的麻烦。\n最好的旅行是体验不同的自然感受：写这篇攻略也是自己的一点生活经验，每一个地方都是都有两面性，我希望大家辩证看待。很多人说很坑，在这里雨欣不得不说一句很多时候只是因为你贪小便宜的心理导致坏人有机可趁。旅途中的心情决定了一场行程的好坏，所以雨欣建议不要所以贪图小便宜，也不要随意参加低价购物团。如果想在有个愉快行程的，请您耐心看完这篇攻略，有什么问题都可以加我主页V咨询，（这个号是用来发布旅游总结，玩法线路，住宿安排，景点交通，注意事项等，欢迎关注！） 网上的攻略都 大同小异，最主要的是吸取精华，灵活运用。郑重提醒大家，一定要先制定行程，再根据行程安排，来考虑订房，而不是反过来，否则整个旅行都很被动。",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf32045c972e85a0034030"),
    questionId: NumberLong("58"),
    coverUrl: "a44c7b7d-4d43-423a-9b70-e56436dfb236.jpg",
    summary: "泸沽湖自驾环湖\n泸沽湖环湖主要两种方式：\n1、自行车环湖\n2、租车，包车或者拼车。\n3、跟纯玩团就不...",
    authorId: NumberLong("22"),
    authorname: "八仙",
    level: NumberInt("1"),
    headUrl: "/qaz12.jpg",
    creatTime: ISODate("2019-11-28T02:33:40.695Z"),
    content: "泸沽湖自驾环湖\n泸沽湖环湖主要两种方式：\n1、自行车环湖\n2、租车，包车或者拼车。\n3、跟纯玩团就不用自己租车。\n由于各种原因，之前的电瓶车环湖取消了，现在只有自行车???♀?，建议除非有很强的身体素质，平常自己也在做类似的体育锻炼，不然不要选择这种了，毕竟还是高原，容易高反而且紫外线很晒。\n包车一般￥200-￥300一辆车，拼车￥75一个人，不包括女神湾日落，需要去的加￥50。\n来一张3D图片，可以放大了看，很清晰。基本环湖一圈泸沽湖的所有知名地方都去遍了。\n来之前看到里的一堆地名也是大手一挥，去了再说。其实，这些都是沿湖分布的村子，如图，1-5依次是大落水村、里格村、小洛水村、阿陆村、蒗放村。\n离①大落水村比较近的两个小岛是洛克岛和里务比岛，③小洛水村附近的小岛是尼塞岛，⑤蒗放村对面的小岛是王妃岛，要去这些小岛可以分别在这些村子的码头坐猪槽船，一般都是50/人。\n泸沽湖的旅游是当地统一管理，因此环湖车队也是统一管理和调度的。不管在哪个酒店找拼车都是由调度统一安排车辆，拼车环湖一般是从大落水出发，顺时针环湖一周，各个点都会停车，最后回到大落水结束，草海、走婚桥、情人滩、女神湾就散落在这些村落间，环湖都可以到达。如果你住在其他地方拼车环湖会很不方便。如果像我们这样跟团，那就在哪里都没有关系啦！\n出发之前先来了解下各景点还是很有必要的：\n其实到了景区，门票处会发几张地图给你，那个地图很靠谱来着。道路和景点都标注得很明白，我们就是用那个地图在景区里游走滴。\n【大落水村】是泸沽湖开发最早的地方，公共设施相对完善，交通便利，客栈很多且价格便宜。在大落水码头，可以乘猪槽船去里务比岛或者洛克岛。",
    golden: true,
    thumbupNum: NumberInt("1"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf35425c972e85a0034031"),
    questionId: NumberLong("60"),
    coverUrl: "177d264d-c5d8-4503-ae7a-6c0b49fea3f3.jpg",
    summary: "成都出发浏览乐山和峨眉山，根据我的经历我觉得这样安排比较好，因为浏览乐山不会用很长的时间，所以先到乐...",
    authorId: NumberLong("22"),
    authorname: "八仙",
    level: NumberInt("1"),
    headUrl: "/qaz12.jpg",
    creatTime: ISODate("2019-11-28T05:22:19.521Z"),
    content: "成都出发浏览乐山和峨眉山，根据我的经历我觉得这样安排比较好，因为浏览乐山不会用很长的时间，所以先到乐山，再去峨眉山比较好。\n第一天、成都出发，在成都城北客运中心乘坐大巴车先到乐山的肖坝客运中心，下车后谁也不要理睬，出车站连马路都不要过就在车站的门前马路边上乘坐13路公交车，可以直达乐山大佛景区的正门。浏览大佛后就在大佛正门前还乘坐13路公交车返回乐山肖坝客运站，然后在客运站乘坐中巴车到峨眉山，车程大约在四五十分钟吧。下车后，就住宿在峨眉山报国寺客运站附近就可以，丰俭由人，不是旺季不用提前预订酒店。\n第二天、在报国寺旅游客运中心乘车直达雷洞坪，然后徒步到接引殿，在乘缆车上到金顶，浏览后原路返回到雷洞坪，乘车到 五显岗，再徒步到清音阁，然后再上行到一线天，生态猴区，浏览后在返回五显岗，从五显岗乘车到到报国寺，在乘车返程。\n上面两天的行程，没有安排万年寺，如果增家万年寺那时间就太紧张了。如果你安排三天时间就可以增加万年寺和伏虎寺，报国寺了。\n三天可这样安排：\n第一天、乐山浏览后，夜宿峨眉山。\n第二天、早点出发，上午浏览伏虎寺，报国寺后，10：30左右乘车到万年寺，浏览万年寺后，在乘车到雷洞坪，徒步到接引殿，可以缆车上到金顶，夜宿金顶，也可以返回下山住宿在太子坪，也可以暂时不上金顶注入住宿在接引殿。转天再上金顶观日出。\n第三天，看过日出后下山，到雷洞坪乘车到五显岗，然后上行到一线天和生态猴区，浏览后原路返回五显岗，乘车返回报国寺客运中心，再乘车返程。\n三天的安排基本把峨眉山的精华景点都浏览了，凡事不能去浏览的景点，那就是必须徒步才能抵达了。\n特别说一下：\n1、乐山浏览我觉得只浏览乐山大佛景区就可以，比如乐山大佛，载酒亭、藏书楼，凌云寺，灵宝塔、麻浩崖墓、濠上大桥、乌尤寺，其他的可以省略，尤其有个东方佛都那是后来新建的，我个人觉没有什么文化底蕴，是否浏览看个人心气吧。\n2、万年寺注意浏览那个无梁殿，报国寺注意看看那个几百字的对联，金顶就不多说了应该仔细浏览瞻仰，敬香礼佛。 时间充裕的话可以浏览一下峨眉山博物馆，就在第一山亭附近，前往伏虎寺报国寺会路过博物馆的。下图为万年寺无梁殿。",
    golden: true,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf356b5c972e85a0034032"),
    questionId: NumberLong("54"),
    summary: "111",
    authorId: NumberLong("22"),
    authorname: "八仙",
    level: NumberInt("1"),
    headUrl: "/qaz12.jpg",
    creatTime: ISODate("2019-11-28T05:26:52.267Z"),
    content: "111",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf38005c972e85a0034033"),
    questionId: NumberLong("61"),
    coverUrl: "c248723d-d7ba-4bba-93b0-383808a9ce47.jpg",
    summary: "中国的神农架野人是世界“四大未解之谜”之一，于三千年前古藉中就有记载。目前为止，在神农架林区目击野人...",
    authorId: NumberLong("23"),
    authorname: "不思蜀",
    level: NumberInt("1"),
    headUrl: "/qaz13.jpg",
    creatTime: ISODate("2019-11-28T02:59:12.252Z"),
    content: "中国的神农架野人是世界“四大未解之谜”之一，于三千年前古藉中就有记载。目前为止，在神农架林区目击野人的人数达上百人，人们甚至可以绘声绘色地讲出野人的形状、神态、毛发、脚印。这些光怪陆离而又不可思议的传闻，给神农架增添了神秘的色彩，没准你就是下一个目击者哦。\n五月赏杜鹃花海\n“人间美西施，花中唯杜鹃”，神农顶景区是高山杜鹃的天堂，每年4-6月份千簇万丛鲜花依次盛开，漫山遍野绵延十多公里，万紫千红争奇夺艳，如云霞如薄雾。置身于高山幽谷之中，被百花围绕，暗香扑鼻，令人心旷神怡。\n 神农架那么神秘，野人或许十年前真的会有，现在真不敢说，科技的发展与工程人的伟大，给这片神秘原始深林的秘密并不多了，但是我们在神农架的开发与旅游区域其实只是一小块，谁能保证没有一方净土呢，神农架的神秘在于野人传说带来的无尽遐想，但我认为更多的是我们在面对神农架时保持敬畏自然的心，尊重自然，顺从内心，神农架就是我们心中的净土，我们何尝不是对世界充满探知欲的野人呢\n神农架有没有野人，我以前只在新闻上看过报道。我个人认为可能只是一个传说，现实中的神农架恐怕没有野人存在。神农架最好玩的，我觉得应该算大九湖吧，山水相连，交相辉映。值得在那儿小住，慢慢欣赏美景。\n真的有野人，但是你能不能见上就看你的运气了，而且你发现野人提供线索你还有奖金拿喔",
    golden: true,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf38575c972e85a0034034"),
    questionId: NumberLong("61"),
    coverUrl: "8609cb52-46e4-4f88-8cc7-94417dd99c17.jpg",
    summary: "木鱼镇附近的话，天生桥和香溪源好玩，天生桥和武隆的天坑地缝有相似之处，如果你没去过武隆那一定要去天生...",
    authorId: NumberLong("23"),
    authorname: "不思蜀",
    level: NumberInt("1"),
    headUrl: "/qaz13.jpg",
    creatTime: ISODate("2019-11-28T03:00:39.097Z"),
    content: "木鱼镇附近的话，天生桥和香溪源好玩，天生桥和武隆的天坑地缝有相似之处，如果你没去过武隆那一定要去天生桥，一个洞中巨大的瀑布，很壮观；香溪源是水源，水很清，很绿，很美，不过现在周边隔开了，不能靠水源太近了；官门山，这个像个大型植物园，里面有科普展览、中华蜜蜂、娃娃鱼，但是不是很好玩，如果你去的时候赶上杜鹃开放，应该会很美；再就是神农祭坛，我做攻略的时候直接把它忽略了，感觉没玩头，后来我同事去了也说不好玩，就一棵古杉树，一个神农像，但是你买联票的话就包括了，可以去瞅一眼。\n然后神农顶，这个必须去，金猴岭可以看原始森林和丛林中的瀑布，大小龙潭有金丝猴，板壁岩的石头很有特色，凉风垭的风真的很大，还有青云梯那里可以攀神农顶最高峰；\n然后天燕景区，这个也要去，里面那个腾空而起的桥，站在上面看风起云涌，真的是风起云涌一点不夸张，还有燕子洞，可以自己带个手电；红坪画廊可以和天燕在同一天游览，红坪画廊也挺美的，但是里面那个一线天没有必要完全爬上去，爬到顶如果不原路返回就得包车下来了，而且最上面啥也没有，我觉得你稍微爬一爬，累了掉头回去就行了，爬到顶太累了。\n再就是大九湖了，有时间去住一晚，景色还是很美的。\n安全提示和风俗：特别的风俗好像没有，在那没觉得和别的地方有啥不一样的；安全提示的话，开车路上注意转弯，如果下了很多天雨要注意山体滑坡，我们去的时候遇到小型泥石流，堵了半条路，后来听说整条路都中断了，所以不建议在多日阴雨之后去玩，山体比较松。还有就是神农顶海拔有3000多米，比较冷，要穿厚一点，我夏天去下小雨，神农顶上14度…",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf39125c972e85a0034035"),
    questionId: NumberLong("64"),
    coverUrl: "b717e595-768b-4eba-b471-e2f82a89a34c.jpg",
    summary: "张家界位于湖南西北部，保存着完好的青石板路及古民居。澧水中上游，...\n张家界的山被誉为“天下奇山”...",
    authorId: NumberLong("23"),
    authorname: "不思蜀",
    level: NumberInt("1"),
    headUrl: "/qaz13.jpg",
    creatTime: ISODate("2019-11-28T03:03:46.083Z"),
    content: "张家界位于湖南西北部，保存着完好的青石板路及古民居。澧水中上游，...\n张家界的山被誉为“天下奇山”，在360多平方公里的土地上，耸立着3100多座石峰，其形态各异、变幻万千，尽情的展示着大自然的美丽、壮观。张家界的水象峰林大山中流淌出的乳汁，清纯甘露，源源流长。张家界的黄龙洞是神奇美妙的地下迷宫，千姿百态、玲珑剔透的石笋、石柱构成了绝世的地下溶洞。\n张家界的宝峰湖是风光秀丽的人间瑶池，一泓碧水、四面青山、飞流瀑布、高峡平，是山水风景融为一体的人间佳作。而凤凰就更不用说了……国内三大艳遇之地（丽江、 凤凰、 阳朔），名声鹊起还是因为沈从文的一篇《边城》说起。\n张家界、凤凰可以说已经是名气远扬，属于每一个旅行爱好者必须去的地方。张家界的美丽风光是由山、水、洞、湖组合而成，用它们的雄伟、神奇、美妙展现着大自然的美丽、壮观。\n张家界精华景点：一：张家界国家森林公园门票248元(三天有效）\n张家界最值得游玩的景点为：武陵源，它是整个张家界地区景点里精华中的精华，是张家界主景点，也是中国第一个国家森林公园、世界自然遗产、中国AAAAA级景区。",
    golden: true,
    thumbupNum: NumberInt("1"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf39dc5c972e85a0034036"),
    questionId: NumberLong("64"),
    coverUrl: "098cec00-53c0-4b9d-93fd-bd81b4226ae2.jpg",
    summary: "张家界国家森林公园景区相当大，面积约130平方公里，里面包含有小景区：金鞭溪、袁家界、杨家界、天子山...",
    authorId: NumberLong("24"),
    authorname: "小黄人",
    level: NumberInt("1"),
    headUrl: "/qaz14.jpg",
    creatTime: ISODate("2019-11-28T03:07:08.294Z"),
    content: "张家界国家森林公园景区相当大，面积约130平方公里，里面包含有小景区：金鞭溪、袁家界、杨家界、天子山、黄石寨，十里画廊、袁家界等众多景区景点，而像黄石寨、天子山等景区又包含：金鞭岩、千里相会、御笔峰、采药老人、夫妻岩、神鹰护鞭、乾坤柱(电影阿凡达外景拍摄原景点)天下第一桥等无数具体景点。可以说不去国家森林公园游览，枉来张家界一趟。国家森林公园里的奇石奇景是三分靠观赏，七分靠想象的，如果你是自助游我建议最好是参加一个散客团，有导游的简介和带路你才能真正体会到张家界国家森林公园的魅力，俗话说的好，景色美不美，全靠导游一张嘴\n张家界国家森林公园·分为黄石寨、琵琶溪、金鞭溪、鹞子寨、畲刀沟、袁家界等景区，是游玩张家界不可不去的核心景点。 ·处于峰林演化史的青年期，地貌奇特，石峰林立，形态各异，树木茂盛；坡陡沟深，气候暖湿。 ·黄石寨是张家界国家森林公园境内最著名的景区，素有“不到黄石寨，枉到张家界”之说。\n张家界天门山国家森林公园门票261元\n位于张家界市区附近的国家级景区，有“天门洞”“鬼谷栈道”“天门山索道”“玻璃栈道”“天门山寺”“99道弯通天大道”等著名景点，是我强烈推荐游玩的地方，一定要拿出一整天的时间哦。图为：世界上最长的索道张家界国家森林公园和天门山国家森林公园是张家界旅游不可错过的两大景点，对自己来说也是一大考验，一天下山基本上都是在走路爬山，所以平常不锻炼的亲们临时抱佛脚是很有必要的哦！\n天门山国家森林公园·天门山因自然奇观“天门洞”而得名。游览天门山时，可以在缆车中俯瞰脚山中美景。 ·核心景点是天门山寺，寺附近的“求儿洞”，民间传说送子观音在此显圣，虔心许愿可求儿女。 ·一定要体验建在悬崖峭壁上的玻璃栈道，看到脚下的万丈深谷，胆战心惊之余，感受凌空行走的快乐。 ·天门山有三条游览线可以选择，都是景区中的经典景色，觉得的视觉震撼。",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf3a455c972e85a0034037"),
    questionId: NumberLong("63"),
    coverUrl: "1a3d017e-00a6-4c7c-9f81-8c59954bc8fd.jpg",
    summary: "第一天，（武昌）（辛亥革命纪念馆）-黄鹤楼-武汉长江大桥-户部巷-昙华林-（楚河汉街）\n辛亥革命纪念...",
    authorId: NumberLong("24"),
    authorname: "小黄人",
    level: NumberInt("1"),
    headUrl: "/qaz14.jpg",
    creatTime: ISODate("2019-11-28T05:21:58.981Z"),
    content: "第一天，（武昌）（辛亥革命纪念馆）-黄鹤楼-武汉长江大桥-户部巷-昙华林-（楚河汉街）\n辛亥革命纪念馆和黄鹤楼挨着在，所以一起推荐一下，周一闭馆！\n从首义路地铁站到辛亥革命纪念馆也就一站路左右，如果是武昌站过去，也就两站路左右！\n前面几个相互之间步行可到的，户部巷到昙华林也就一两站路，很近的！\n晚上还有时间可以去逛逛楚河汉街，是条步行街，夜景不错，附近有地铁4号线可以坐！\n\n第二天，（武昌）武汉大学-（东湖绿道）-东湖磨山景区-（光谷步行街）\n因为东湖面积很大，我比较推荐你去磨山景区，风景不错，而且现在大部分都是免费开放的了！\n武大大门附近有413路公交可以直达磨山景区！\n因为最近武汉雨水比较多，如果你去东湖的那天，天气还可以的话，也可以去走走东湖绿道！\n从武大东门出去就是东湖绿道-湖山道的入口啦，湖山道连接了武大和磨山景区...\n湖山道大概6公路左右，步行大概要1.5个小时以上，除了选择步行，还可以骑行，东湖绿道上也有很多共享单车的，还可以选择坐电瓶车（20元）！\n磨山景区那里有401路直达光谷步行街！\n第三天，（汉阳-汉口）（归元禅寺）-晴川阁-（汉口江滩-黎黄陂路）-中山大道-江汉路步行街\n归元禅寺和晴川阁都在汉阳，其他景点在汉口...\n归元禅寺的香火很好，面积也挺大的，可以去数数罗汉，从首义路那边过去也就几站路！\n给你加一个汉口江滩一个黎黄陂路，都在江汉路附近，步行可到！\n不过最近汉口江滩的水位涨起来了，如果是下雨天，最好还是别去了！\n江汉路步行街那里有地铁2号线和6号线可以坐！",
    golden: true,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf3ace5c972e85a0034038"),
    questionId: NumberLong("63"),
    summary: "根据楼主您的要求，\n为您选择了一些最富特色的武汉 精华景点，\n并且为了保证行程的舒适性，\n每一天会为...",
    authorId: NumberLong("25"),
    authorname: "皮卡丘",
    level: NumberInt("1"),
    headUrl: "/qaz15.jpg",
    creatTime: ISODate("2019-11-28T03:11:10.666Z"),
    content: "根据楼主您的要求，\n为您选择了一些最富特色的武汉 精华景点，\n并且为了保证行程的舒适性，\n每一天会为您安排3-4个景点，\n同时景点之间多有公交系统连接，\n让您既可以好好游玩，\n又不会感到太累。\n具体行程如下：（主要是考虑景点的地理位置分布而规划，一路美食也会精心奉上）：\n第一天在汉口上游沿线游玩，距离您预订的酒店不远，您可以到达后先去酒店放好行李，漫步于武汉 百年老街——江汉路步行街，欣赏江景的好地方——晴川阁，和拍客评价很高的——古德寺（门票8元）。晚上到吉庆街品尝美食，感受武汉 的市井美食文化。\n第二天，黄鹤楼沿线一天，上午先前往武汉 的地标——黄鹤楼（门票80），下午到临近的武昌革命纪念馆（俗称红楼，拍客们非常喜欢的景点）拍拍照，晚上到美食一条街——户部巷（三鲜豆皮、蔡林记的热干面、徐妈妈的鱼糊汤），尝尝汉味美食，然后走走中国第一桥——武汉 长江大桥，欣赏一下武汉 的夜景。\n第三天，东湖沿线游，上午先去风景如画的东湖，下午前往中国最美丽的大学——武汉 大学，下午前往文艺小巷子——昙华林，感受近代武汉 的独特风情。晚上到光谷路步行街欣赏美丽的灯光，品尝美食（这一线有不少咖啡馆和西餐厅）\n预算方面，\n由于为您选择的多是免费景点，加上您已经找好了住宿。按照每天百元的美食消费，所以在武汉 市内的花费大概1000-1500元左右就可以了\n最后送上一些温馨提示：\n1、请带好身份证等证件，\n以方便打折和进入参观（例如红楼等地，需要身份证才能入内）。\n希望可以帮到您，望采纳，谢谢  ",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf3b8b5c972e85a0034039"),
    questionId: NumberLong("64"),
    coverUrl: "898ab98b-36b1-44cb-9469-5888abdcc671.jpg",
    summary: "    去张家界玩3天，时间够用吗？到张家界只有3天假期，时间预算怎么安排，既要自由轻松，还要游玩中...",
    authorId: NumberLong("25"),
    authorname: "皮卡丘",
    level: NumberInt("1"),
    headUrl: "/qaz15.jpg",
    creatTime: ISODate("2019-11-28T05:28:22.974Z"),
    content: "    去张家界玩3天，时间够用吗？到张家界只有3天假期，时间预算怎么安排，既要自由轻松，还要游玩中不赶时间能玩到最精华的景点，我相信每个蜂蜂都很想快速了解，毕竟每一次的旅行都希望玩的开心还能最省心，品质出游已经是咱们期待已久的。\n    对于很多人时间不多，又比较紧张，推荐一条合适的3日游行程，玩到张家界最核心精华的景点，比到处翻攻略，了解旅游线路，住哪里，玩哪里太过麻烦，蜂蜂们，最轻松自由还不赶时间又能游玩到张家界精华的景点是不是你想要的呢\n最核心的景点哈利路亚山悬浮山取景地 by 悠游旅行张家界3日游主要游玩哪些景点张家界最核心的景点要数森林公园、天门山、大峡谷玻璃桥了，3天的时间可以把这些景区的精华景点玩个够，很多游客分不清楚这些景点的关系，有些认为玻璃栈道和玻璃桥就是一个，有些以为玻璃栈道就是在森林公园里面，甚至有些会认为到张家界只用买森林公园一张通票就可以玩张家界其他所有景点，也许是在网上咨询的一些不靠谱的人乱说一通，为了能给大家清楚的了解张家界，到张家界要玩哪些景点，包括要怎么玩，看看下面的攻略也许你就明白了。\n    主要游览大峡谷景区和玻璃桥景区，建议来此景区的朋友都购买B线套票大峡谷+玻璃桥游览，仅仅游览C线单玻璃桥，20-30分钟真的没多大意思，大老远来玩一趟，就到桥上走20-30分钟就回去了，真的比较可惜，甚至很多游客走完都抱怨没什么意思，所以这里建议不要怕浪费一百多块钱，既然来了就走B线玩个够。\n入园时间：07:30-16:00，分不同时间段入园。\n门票价格：A线单大峡谷挂牌94，B线套票大峡谷+玻璃桥挂牌219。 ",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf3ca25c972e85a003403a"),
    questionId: NumberLong("64"),
    coverUrl: "00d7ffe9-7fce-4d3d-b2be-19fa0c6f24e7.jpg",
    summary: "张家界目前5A级景区有2个\n1、张家界国家森林公园：门票245元，\n2、天门山国家森林公园：门票25...",
    authorId: NumberLong("26"),
    authorname: "臭小子",
    level: NumberInt("1"),
    headUrl: "/qaz16.jpg",
    creatTime: ISODate("2019-11-28T03:18:58.759Z"),
    content: "张家界目前5A级景区有2个\n1、张家界国家森林公园：门票245元，\n2、天门山国家森林公园：门票258元。想要了解更多 点我头像有联系方式 这两个景区是独立的景区，备注：“玻璃栈道”在天门山景区）。\n4A级景区有5个\n1、张家界大峡谷门票118元，玻璃桥：门票138元，\n2、黄龙洞：门票100元，\n3、宝峰湖：门票96元，\n4、人文景区——土司皇宫(土家风情园）：门票118元）\n以上包括自然与人文景点总共列出了7大景区。\n张家界国家森林公园（5A级 首选必玩）：离市区38公里（车程50分钟），张家界国家森林公园可以说是世界绝版资源，不仅是世界自然遗产、世界地质公园、全国首批5A级景区、中国第一个国家森林公园。\n它以其独特的石英砂岩峰林地貌，在全球范围来说“实属独一无二”，可以说在同类景区当中，足以傲视全球。因此该景区也是整个张家界所以景区的代表。张家界国家森林公园景区面相对来说还是很大的，积约398平方公里，其门票有效期虽然为4天，但一般玩两天足以。（游玩时间：2天 精华游）。\n备注：张家界国家森林公园248元的成人票价，谨记在任何人手里均买不到优惠票或打折票，因为张家界国家森林公园是国家经营管理的（不属于私人开发）。请不要轻易相信“江湖人士”帮你能买到所谓的“优惠票”，“打折票”，他们就是下套诱惑你参加他们的“低价”游，谨防上当受骗，特此声明。\n\n\n天门山国家森林公园 成人票价261元，还有“江湖人士”帮你能买到所谓的更低“优惠票180元或200元”，他们就是下套诱惑你参加他们的“低价”游，谨防上当受骗，特此声明。\n提示：天门山门票执行分时段上山政策。门票上面写有检票时间段，就在那个时间段才能排队\n\n张家界大峡谷成人票价 118元，保险3元。（玻璃桥门票价 138 元），玻璃桥是世界最高、跨度最长的玻璃桥，大桥建在大峡谷两侧的峰顶上，横跨大峡谷，桥拱距谷底相对高度约400米，全长约370米，桥面全部采用透明玻璃铺设，桥中心有全球最高的蹦极。站在桥上，脚下400米处的谷底全景尽收眼底。\n温馨提示：大峡谷景区（玻璃桥）门票是实名制提前订票，还是分时间段（就是进景区游览限流，分批进入，不是你买了票就能进去的）。自驾车朋友注意，只要您的车驶入张家界范围，你的车牌就被路边拉客人记住了，在张家界高速的出口处，有很多的假交警拦车，他们身穿制服，不要被假交警蒙蔽，只要没开警车，都是假交警，可以不去理会。不要理路旁向你招手的美眉或者是大姐的搭车，大多是以帮你们安排住宿和优惠低价门票为诱惑，现在出现一种新的形式：以极低的价格给你介绍星级酒店，他们会贴钱帮你定房（比如说一个四星级酒店客房最底要260，他们可能160元买给你，在这种超级实惠的情况下你绝对不可能不动心)从而让你产生信任感，然后要你参加他们的团（先用非常低廉的价格忽悠您先到所谓某某国旅办公室），再狠狠的宰你，让你进退两难，所以提醒朋友们不要为了贪取一点小便宜而损失的可就不是一点点了。如果你选择在下高速后找就近路边的旅行社门市报名，那就恭喜你了，你绝对是很有钱的主，不宰你宰谁，建议提前在网上预定好，比起你误打误撞找上门强，千万不要搭讪！\n\n在张家界旅游比较特殊，张家界的自助游、自由行实际上是半自由行，张家界森林公园景区里面都是大山里面，并且景区太大（398平方公里，核心景区264平方公里），线路复杂，绕路、走往返、冤枉路是很多纯粹的自由行旅游者所经常碰到的事情，时常因景点太美而忘了时间，景区里面且岔路多，如果方向感不强，较少独自出游经验的，请一个不为过，当你遇到岔路或其他意外情况，你就不会惊慌，更不会因走错路而浪费时间错过精华景点，而且景区物价高。到张家界的游客一般都是参加旅行社或参加张家界自助游接待单位的独立成团或者拼团游。\n自己纯自由行、自助游劣势：费心费力，出发前要计划周密，订房订票等等。到了旅游目的地，在没有导游的情况下，很容易被骗，食宿游都会抬高价，比跟团游花费的就更多了，如临时出现意外情况，也不方便迅速处理，张家界山路很复杂，就算不跟团也找个导游带一带比较好。不想麻烦的可以选走的线路很经典，而且是休闲纯玩的，所以景点会比一般的旅行社按排多很多，旅行团去的和旅行团不到的地方都会带去玩，让你在短时间里把张家界精华景点该看的，该玩的，都游玩到，不留遗憾！\n张家界景区由于比较多，所以需要挑选一些值得一玩的景区。一般对于大众（时间不是很充裕）来说，玩2天或者3天较为合适。\n自由行线路是以休闲为主要目的一种半自助旅游形式，交通工具+酒店+旅游景点为核心，精心为游客打造的系列套餐产品。自由行为客户提供了很大的自由性，旅游者可根据时间、兴趣和经济情况自由选择希望游览的景点、入住的酒店标准以及出行的日期，在价格上一般要高于旅行社的跟团产品，但要比完全自己出行的价格优惠许多。不用跟随大众的步伐，想怎么游就怎么游，更自由、方便，时间安排可以随意调整，行程上的游览也任意改变，游客可以把钱花在“刀刃”上。",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf3e4c5c972e85a003403b"),
    questionId: NumberLong("62"),
    coverUrl: "db185c2f-8479-4869-8e28-12f25cca3ecb.jpg",
    summary: "分享一个自身的经历：\n\n我是一个坚决不跟团的人，唯一一次跟团是14年单位跟团去了一趟九寨沟黄龙，那一...",
    authorId: NumberLong("25"),
    authorname: "皮卡丘",
    level: NumberInt("1"),
    headUrl: "/qaz15.jpg",
    creatTime: ISODate("2019-11-28T03:26:04.911Z"),
    content: "分享一个自身的经历：\n\n我是一个坚决不跟团的人，唯一一次跟团是14年单位跟团去了一趟九寨沟黄龙，那一趟的体验，真的不知道用什么语言来形容。\n\n先说导游，导游是个藏族的小伙子，在第三天的时候，导游和游客发生了冲突，但是我还是觉得是那个游客有问题，毕竟是游客先开的头...这个后面再说。\n\n我们报的是一个九黄四日游，团费500。当时看到这个团费，我就知道这趟出去是要花钱的，九寨沟门票350，黄龙门票200，光门票都不止这点钱了，还要路费、住宿、吃饭等等，500块钱怎么拿得下来，虽然当时旅行社是告诉我们“让你自费，你不自费就行了”，但是他也就那么一说，我也就这么一听，自己还是过过脑子吧。\n\n然后分享一下我们的行程\n\n第一天，纯坐车，早上五六点就上车了（重庆—九寨沟），到了九寨沟就已经是晚上七八点了。\n\n早上出发的时候太早了，一上车大家都在补瞌睡，大概十点左右的时候，游客都陆陆续续醒了，导游就开始给大家作介绍做讲解，也在努力提升自己的好感度；\n\n下午大概两点的时候，导游就开始向游客收取自费项目费用280，280包含两个项目，一个藏民家访，一个是藏族歌舞表演；我们单位的几个小伙伴倒是想都没想就直接缴费了，大家想法应该都差不多，觉得这个钱是“该”花的，但是我们这个团很多人都不愿意交这个钱，导游后面说这个280其实是他交给旅游公司的人头费，要大家都交了这280他才能回本等等之类的话，有些人选择只交一个项目的钱，有的人还是不愿意交，其实你交不交对我而言是没有任何关系，但是有3个年轻游客就比较扯了，说“我可是交了团费出来玩的，我出来身上一分钱都没带！” 我不知道作为导游听到这个话是个怎么个想法，反正我一个毫无相关的旁边人听到这句话我是觉得挺无语的。。。\n\n第二天，可以说是最快乐的一天，因为第二天进沟，早上九点进去，下午六七点出来，这9个多小时完全是自己安排，当然，中午饭也是自己安排，毕竟是进去以后自己玩自己的\n\n晚上看藏族歌舞表演。\n\n第三天，无语的事情就开始了。早上六点起床，出发去进店。又是那三位没有自费的年轻游客，估计是嫌早上起得太早了，就开始BB了，BB就BB吧，居然在车上指桑骂槐的骂导游（其实导游并没有惹他们的），大哥，不是我说，这好歹也是人导游的地界儿啊，你在别人藏族人的地盘没有毫无理由的去骂别人藏族人，你这......   导游愤怒了！直接走到这三个人的面前，对着他们开始吼了，\n\n“500块钱退给你们！你们给我下车！我不差你们这500块钱！不要坐我的车！自己坐车回去！”。\n\n估计是被导游的气势给吓住了，那三人直接就蔫了，但是还是在那里小声的反抗“我们交了团费的我们凭什么下车”“回去投诉你”之类的，这个时候导游才放了句狠话\n\n“你信不信回了重庆老子一样弄你！”\n\n。然后就开车了\n\n然后就开始了进店，先进珠宝店，再进药材店，再进牛肉干店。结果我们这个团的消费情况可以说是惨不忍睹，本应该最赚钱的药材店，消费简直惨淡（就只拿我们单位的小伙伴来说，一行五个人，就我买了几百块的藏红花和几百块的川贝，其他人0消费）  导游无语了，改了我们的行程，本应该下午1点进黄龙，导游带我们去参观藏寨，说是参观藏寨，其实就是去买银器，导致我们3点才进黄龙。要我们6点集合。得亏我没有高反，整个黄龙我是全程跑下来的！跑着爬上去，跑着下的山，宝宝心里苦.....\n\n然后为了为了第四天可以继续愉快的购物，晚上开车开到10点才休息，把车上一行游客饿得像一群**一样，还好我还买了点牛肉干....\n\n第四天，早起，进羌寨，又买银器，然后回家的路上有进店，卖貔貅的，卖竹炭的，明明可以五六个小时回家的路程，我们晚上8点才到重庆.....\n\n期间导游跟另外游客发生的冲突，我不想多作评论，一方面的确是游客先挑的事，一方面导游确实也是服务行业，反正与我无关，我看看就好，\n\n但是这整整4天，96个小时啊！！！我总共用于旅游玩耍的时间居然只有九寨沟的9个小时+黄龙的3个小时=12个小时！！！！  4天，我只玩了12个小时！！！！！！\n\n你问我跟团游我遇到过啥糟心事，我只能说，跟团游本身就是个糟心事！！",
    golden: true,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf3ef45c972e85a003403c"),
    questionId: NumberLong("62"),
    coverUrl: "4883d74d-7bac-40b0-b199-4605beb3d233.jpg",
    summary: "你好，其实在鼓浪屿看日出和日落都是非常好的已交事情，关于具体地点，众说纷纭，我个人觉得，有2个地方非...",
    authorId: NumberLong("27"),
    authorname: "你是谁",
    level: NumberInt("1"),
    headUrl: "/qaz17.jpg",
    creatTime: ISODate("2019-11-28T03:28:52.297Z"),
    content: "你好，其实在鼓浪屿看日出和日落都是非常好的已交事情，关于具体地点，众说纷纭，我个人觉得，有2个地方非常适合，一个就是在日光岩的最高处，另一个就是在海边，鼓浪屿靠最西边的海边，看日出日落，要么就是最高点，要么就是最低点，建议去日光岩吧，既可以看日出，还可以看看鼓浪屿的全景\n要提前订票，可以微信关注厦门轮渡有限公司提早订票，岛上的一些景点需要购票，建议买套票，淘宝上买会便宜点，但是有兑换截止时间要注意下哈。  \n\n游客需要到国际邮轮码头站乘船到鼓浪屿，具体各个地方到码头的交通：\n厦门轮渡码头  \n距离码头5.3公里    \n乘出租车约9分钟，乘坐51，841，139,655，邮轮码头旅游快线至国际邮轮码头站/邮轮中心码头站/东渡狐尾山站下。\n海沧嵩鼓码头            \n距离码头12.7公里    \n乘出租车约17分钟，乘坐852/842至东渡站下。\n第一码头\n距离码头3.3公里    \n乘出租车约7分钟，可现步行至第一码头公交车站，乘坐公交车954,84,路至东渡狐尾山站下。\n厦门站（火车站）\n距离码头6.2公里    \n乘出租车约16分钟，乘坐公交车26，842，43，58路至邮轮中心码头/东渡狐尾山站下。\n厦门北站（火车站）\n距离码头21.4公里    \n乘出租车约26分钟，乘坐公交957路至东渡站下。\n厦门高崎站（火车站）\n距离码头8.6公里    \n乘出租车约10分钟，乘坐59，655,954路至邮轮中心码头站下。\n厦门高崎国际机场  \n距离码头10.7公里    \n乘出租车约14分钟，乘坐旅游观光巴士、空港快线邮轮码头、84路至邮轮中心码头站/东渡狐尾山站下。\n第一码头（公交车站）      \n距离码头3.2公里      \n乘出租车约7分钟，乘坐公交车954,84,路至东渡狐尾山站下。\n曾厝垵            \n距离码头8.8公里    \n乘出租车约18分钟，乘坐邮轮码头旅游快线，87路至邮轮中心码头站下。\n厦门大学          \n距离码头8.4公里    \n乘出租车约16分钟，乘坐87,22,841，邮轮码头旅游快线至国际邮轮码头站/邮轮中心码头站/东渡站下。",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf59ef5c972e7fc4f0a963"),
    questionId: NumberLong("54"),
    summary: "asdedsdawdax",
    authorId: NumberLong("2"),
    authorname: "bunny",
    level: NumberInt("1"),
    headUrl: "/qaz4.jpg",
    creatTime: ISODate("2019-11-28T05:25:40.939Z"),
    content: "asdedsdawdax",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("answer").insert([ {
    _id: ObjectId("5ddf6ddf5c972e7fc4f0a964"),
    questionId: NumberLong("64"),
    summary: "HAHAHHAH",
    authorId: NumberLong("1"),
    authorname: "琉璃",
    level: NumberInt("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    creatTime: ISODate("2019-11-28T06:49:03.182Z"),
    content: "HAHAHHAH",
    golden: false,
    thumbupNum: NumberInt("0"),
    shareNum: NumberInt("0"),
    thumbuplist: [ ]
} ]);

// ----------------------------
// Collection structure for scenic_comment
// ----------------------------
db.getCollection("scenic_comment").drop();
db.createCollection("scenic_comment");

// ----------------------------
// Documents of scenic_comment
// ----------------------------
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf1ec85c972e4aa8a148c1"),
    scenicId: NumberLong("2"),
    scenicName: "广州塔",
    scenicImg: "/8b4b32bc-c2d5-4c36-9f69-98fc8a560557.jpg",
    userId: NumberLong("1"),
    username: "逍遥",
    level: NumberInt("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    createTime: ISODate("2019-11-28T01:11:36.631Z"),
    content: "广州塔又称广州新电视塔，昵称小蛮腰。位于广州市海珠区赤岗塔附近，距离珠江南岸125米。广州塔塔身主体高454米，天线桅杆高146米，总高度600米。是中国第一高塔，世界第二高塔，仅次于东京晴空塔。广州塔塔身168~334.4米处设有“蜘蛛侠栈道”，是世界最高最长的空中漫步云梯。塔身422.8米处设有旋转餐厅，是世界最高的旋转餐厅。塔身顶部450~454米处设有摩天轮，是世界最高摩天轮。天线桅杆455~485米处设有“极速云霄”速降游乐项目，是世界最高的垂直速降游乐项目。天线桅杆488米处设有户外摄影观景平台，是世界最高的户外观景平台，超越了迪拜哈利法塔的442米室外观景平台，以及加拿大国家电视塔447米的“天空之盖”的高度。",
    overallScore: NumberInt("4"),
    viewScore: NumberInt("4"),
    uniqueScore: NumberInt("2"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf20625c972e4aa8a148c4"),
            parentId: "5ddf1ec85c972e4aa8a148c1",
            userId: NumberLong("2"),
            headUrl: "/images/default.png",
            username: "bunny",
            createTime: ISODate("2019-11-28T01:18:26.631Z"),
            content: "看起来很美",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf22015c972e4aa8a148ca"),
            parentId: "5ddf1ec85c972e4aa8a148c1",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T01:25:21.982Z"),
            content: "是的,毕竟是标志性建筑",
            uid: NumberLong("-1"),
            uname: "bunny"
        },
        {
            _id: ObjectId("5ddf22b85c972e4aa8a148cf"),
            parentId: "5ddf1ec85c972e4aa8a148c1",
            userId: NumberLong("2"),
            headUrl: "/qaz4.jpg",
            username: "bunny",
            createTime: ISODate("2019-11-28T01:28:24.582Z"),
            content: "是滴是滴",
            uid: NumberLong("-1"),
            uname: "琉璃"
        }
    ],
    pics: [
        "/104ec518-79ff-41d5-a948-341252d578db.png/",
        "/2f3ce233-7a86-4799-9136-58ef5d063210.jpg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf1f7a5c972e4aa8a148c2"),
    scenicId: NumberLong("2"),
    scenicName: "广州塔",
    scenicImg: "/8b4b32bc-c2d5-4c36-9f69-98fc8a560557.jpg",
    userId: NumberLong("1"),
    username: "逍遥",
    level: NumberInt("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    createTime: ISODate("2019-11-28T01:14:34.443Z"),
    content: "广州塔是珠江新城主轴线上的核心标志性节点，是整个建筑序列的高潮，是珠江新城城市天际线的引领。作为广州最高的建筑物，坐上460m高度的高空摩天轮（全世界最高的摩天轮）是最独具特色的观景模式，也是观看这个片区城市全貌的最佳方式,就是朋友有点恐高,没有体验摩天轮",
    overallScore: NumberInt("5"),
    viewScore: NumberInt("4"),
    uniqueScore: NumberInt("2"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf20535c972e4aa8a148c3"),
            parentId: "5ddf1f7a5c972e4aa8a148c2",
            userId: NumberLong("2"),
            headUrl: "/images/default.png",
            username: "bunny",
            createTime: ISODate("2019-11-28T01:18:11.405Z"),
            content: "你好,请问交通方便吗?",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf21df5c972e4aa8a148c9"),
            parentId: "5ddf1f7a5c972e4aa8a148c2",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T01:24:47.998Z"),
            content: "交通很方便的,有直达的地铁",
            uid: NumberLong("-1"),
            uname: "bunny"
        },
        {
            _id: ObjectId("5ddf228b5c972e4aa8a148cd"),
            parentId: "5ddf1f7a5c972e4aa8a148c2",
            userId: NumberLong("2"),
            headUrl: "/qaz4.jpg",
            username: "bunny",
            createTime: ISODate("2019-11-28T01:27:39.734Z"),
            content: "坐哪一路地铁啊",
            uid: NumberLong("-1"),
            uname: "琉璃"
        },
        {
            _id: ObjectId("5ddf22a05c972e4aa8a148ce"),
            parentId: "5ddf1f7a5c972e4aa8a148c2",
            userId: NumberLong("2"),
            headUrl: "/qaz4.jpg",
            username: "bunny",
            createTime: ISODate("2019-11-28T01:28:00.213Z"),
            content: "找到了,哈哈,出发",
            uid: NumberLong("-1"),
            uname: "琉璃"
        },
        {
            _id: ObjectId("5ddf2ec05c972e5e8c4cb3e0"),
            parentId: "5ddf1f7a5c972e4aa8a148c2",
            userId: NumberLong("20"),
            headUrl: "/qaz10.jpg",
            username: "想放假的小明",
            createTime: ISODate("2019-11-28T02:19:44.263Z"),
            content: "哪都有哪路公交车能到啊",
            uid: NumberLong("-1"),
            uname: "bunny"
        }
    ],
    pics: [
        "/10d66323-5273-4274-a01e-fe96c9295fc7.png/",
        "/845b9253-cd8a-4597-a82f-938a2bb05184.jpg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf20a25c972e4aa8a148c5"),
    scenicId: NumberLong("2"),
    scenicName: "广州塔",
    scenicImg: "/8b4b32bc-c2d5-4c36-9f69-98fc8a560557.jpg",
    userId: NumberLong("2"),
    username: "bunny",
    level: NumberInt("1"),
    headUrl: "/images/default.png",
    createTime: ISODate("2019-11-28T01:19:30.721Z"),
    content: "这个广州地标建筑，外观还是挺漂亮的，小蛮腰！\n至于登塔后的景色，我觉得在高处看，所有城市的景色真的都差不多，所以并没有多少惊艳的感觉，塔顶的摩天轮可以坐坐，起码可以360度看看整个城市的景色，能看得到下面的珠江。\n至于什么白云观景大厅，星空观景大厅，真是挺无聊的，只不过是屋顶的天棚是蓝天白云的装饰风格和星空的装饰风格而已，人很多，闹哄哄的，然后必须吐槽一下照片，登塔的时候在绿幕前给拍张照片，然后电脑合成一下，一张要120元，2张160元，这种最简单的换背景PS技术，卖这个价格我也是服气的。吐糟吐糟！",
    overallScore: NumberInt("2"),
    viewScore: NumberInt("4"),
    uniqueScore: NumberInt("2"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf21c95c972e4aa8a148c8"),
            parentId: "5ddf20a25c972e4aa8a148c5",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T01:24:25.781Z"),
            content: "照片也太贵了吧,坑",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf22715c972e4aa8a148cc"),
            parentId: "5ddf20a25c972e4aa8a148c5",
            userId: NumberLong("2"),
            headUrl: "/qaz4.jpg",
            username: "bunny",
            createTime: ISODate("2019-11-28T01:27:13.647Z"),
            content: "是的,主要是照片质量也很差",
            uid: NumberLong("-1"),
            uname: "琉璃"
        }
    ],
    pics: [
        "/04d4ed22-0729-4c26-ae21-1b304db4ecc2.png/",
        "/1d121665-d727-40ff-b9ec-24e76660d74a.jpg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf214f5c972e4aa8a148c6"),
    scenicId: NumberLong("2"),
    scenicName: "广州塔",
    scenicImg: "/8b4b32bc-c2d5-4c36-9f69-98fc8a560557.jpg",
    userId: NumberLong("2"),
    username: "bunny",
    level: NumberInt("1"),
    headUrl: "/images/default.png",
    createTime: ISODate("2019-11-28T01:22:23.433Z"),
    content: "我们定的是18点-20点的票，只能到点才能取票，取票是在自助购票机上取。我们到的时候还有半小时，无法提前取票上去，只能在塔下瞎逛半小时，进塔需要安检和检查身份证，然后去电梯处排队，坐电梯上了星空观景台，这边估计星空白云观景台是看坐的哪台电梯的，我们后来才知道这是星空，整个观景台是暗光处理。拍了会照，我们就去顶层的户外观景平台。旁边还有个升降机，那个我不敢玩。太冷了，我们就回到室内，然后又往下走去看了看白云观景台，这边和星空其实差不多，就是一个开灯了，一个没开灯，景色还是星空好点，塔上其他就没啥好看的，我们就下来了，塔底门口还有个隧道一样的景点，挺逼真好看的。交通方便,就是人很多",
    overallScore: NumberInt("4"),
    viewScore: NumberInt("3"),
    uniqueScore: NumberInt("3"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf21ac5c972e4aa8a148c7"),
            parentId: "5ddf214f5c972e4aa8a148c6",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T01:23:56.737Z"),
            content: "什么时候去合适啊?听说有摩天轮可以坐",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf225a5c972e4aa8a148cb"),
            parentId: "5ddf214f5c972e4aa8a148c6",
            userId: NumberLong("2"),
            headUrl: "/qaz4.jpg",
            username: "bunny",
            createTime: ISODate("2019-11-28T01:26:50.496Z"),
            content: "晚上去最好,有夜景可以看",
            uid: NumberLong("-1"),
            uname: "琉璃"
        },
        {
            _id: ObjectId("5ddf2f0e5c972e5e8c4cb3e1"),
            parentId: "5ddf214f5c972e4aa8a148c6",
            userId: NumberLong("20"),
            headUrl: "/qaz10.jpg",
            username: "想放假的小明",
            createTime: ISODate("2019-11-28T02:21:02.774Z"),
            content: "那晚上去人是不是很多啊,排队需要多久啊",
            uid: NumberLong("-1"),
            uname: "bunny"
        },
        {
            _id: ObjectId("5ddf2f155c972e5e8c4cb3e2"),
            parentId: "5ddf214f5c972e4aa8a148c6",
            userId: NumberLong("20"),
            headUrl: "/qaz10.jpg",
            username: "想放假的小明",
            createTime: ISODate("2019-11-28T02:21:09.254Z"),
            content: "",
            uid: NumberLong("-1")
        }
    ],
    pics: [
        "/c14b3710-436c-49f6-b5b2-5e0bba453ce3.jpeg/",
        "/478ca2e6-3aa1-4a0d-ba4e-cc81e696529a.jpg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf25f85c972e4aa8a148d0"),
    scenicId: NumberLong("3"),
    scenicName: "广州长隆旅游度假区",
    scenicImg: "/3868abf2-8f1e-43a0-b6f1-8bc602494c8e.jpg",
    userId: NumberLong("2"),
    username: "bunny",
    level: NumberInt("1"),
    headUrl: "/qaz4.jpg",
    createTime: ISODate("2019-11-28T01:42:16.75Z"),
    content: "中秋来广州的目的，带娃好去处，五大项目，个人觉得推荐性依次大马戏 野生动物园 水上世界 欢乐世界 飞鸟乐园。景区很大，里面熊猫，长隆等酒店，会有一定的便利，但价格也不便利。自驾车还可以20元里面停一天。",
    overallScore: NumberInt("5"),
    viewScore: NumberInt("3"),
    uniqueScore: NumberInt("2"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf304e5c972e5e8c4cb3e8"),
            parentId: "5ddf25f85c972e4aa8a148d0",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T02:26:22.107Z"),
            content: "是的,是一个周末好去处",
            uid: NumberLong("-1")
        }
    ],
    pics: [ ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf26415c972e4aa8a148d1"),
    scenicId: NumberLong("3"),
    scenicName: "广州长隆旅游度假区",
    scenicImg: "/3868abf2-8f1e-43a0-b6f1-8bc602494c8e.jpg",
    userId: NumberLong("2"),
    username: "bunny",
    level: NumberInt("1"),
    headUrl: "/qaz4.jpg",
    createTime: ISODate("2019-11-28T01:43:29.081Z"),
    content: "长隆旅游度假区是长隆集团一手开发的系列主题园区，它包括长隆欢乐世界、长隆水上乐园、长隆野生动物世界、长隆国际马戏大剧院、长隆飞鸟乐园等景区，欢乐世界是个大型游乐场，大马戏是看表演的,值得去",
    overallScore: NumberInt("2"),
    viewScore: NumberInt("3"),
    uniqueScore: NumberInt("3"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf2fd25c972e5e8c4cb3e4"),
            parentId: "5ddf26415c972e4aa8a148d1",
            userId: NumberLong("18"),
            headUrl: "/qaz1.jpg",
            username: "打死不加班",
            createTime: ISODate("2019-11-28T02:24:18.958Z"),
            content: "进去需要单独再买门票吗",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf30355c972e5e8c4cb3e7"),
            parentId: "5ddf26415c972e4aa8a148d1",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T02:25:57.869Z"),
            content: "看你买什么票了,普通票,想玩水上乐园需要额外买票",
            uid: NumberLong("-1"),
            uname: "打死不加班"
        }
    ],
    pics: [
        "/23a4fc7a-0b2a-4b77-9602-5886a50cc903.jpeg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf26d65c972e4aa8a148d2"),
    scenicId: NumberLong("3"),
    scenicName: "广州长隆旅游度假区",
    scenicImg: "/3868abf2-8f1e-43a0-b6f1-8bc602494c8e.jpg",
    userId: NumberLong("19"),
    username: "肚子好饿啊",
    level: NumberInt("1"),
    headUrl: "/qaz6.jpg",
    createTime: ISODate("2019-11-28T01:45:58.233Z"),
    content: "挺好玩的，可以玩儿一整天，几个区域都玩er的话要两三天了，里边东西挺贵的，可以考虑早上吃饱下午出来再吃",
    overallScore: NumberInt("4"),
    viewScore: NumberInt("4"),
    uniqueScore: NumberInt("4"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf2fb65c972e5e8c4cb3e3"),
            parentId: "5ddf26d65c972e4aa8a148d2",
            userId: NumberLong("18"),
            headUrl: "/qaz1.jpg",
            username: "打死不加班",
            createTime: ISODate("2019-11-28T02:23:50.424Z"),
            content: "人多吗,排队得等多久啊",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf2fe05c972e5e8c4cb3e5"),
            parentId: "5ddf26d65c972e4aa8a148d2",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T02:24:32.481Z"),
            content: "多,周末和节假日更多",
            uid: NumberLong("-1"),
            uname: "打死不加班"
        }
    ],
    pics: [
        "/bc3a1d41-c845-4d37-8d70-5be4953a4f86.jpg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf27745c972e4aa8a148d3"),
    scenicId: NumberLong("4"),
    scenicName: "上下九步行街",
    scenicImg: "/ccb1fac8-8ab3-483d-9a2b-9645e924ec16.jpg",
    userId: NumberLong("19"),
    username: "肚子好饿啊",
    level: NumberInt("1"),
    headUrl: "/qaz6.jpg",
    createTime: ISODate("2019-11-28T01:48:36.712Z"),
    content: "我第一次来广州的话，也是去上下九打卡了，因为看外来媳妇本地郎的时候就一直提到哈哈，钟意我噶人从西门口排到上下九啦，hh打趣(〃'▽'〃)虽然打着老广特色，但是这条街的确是商业街，老字号很少！！！还有我第一次过来就差点被骗惹ヾ(◍°∇°◍)ﾉﾞ新朋友千万注意！！！！！凡是发扇子，发小风车，发什么东西给你的都不要收，这是美容黑小店的套路，收了你就得跟他们走，不走就收回，对于小白来讲，比较新奇，人家说得天花乱坠还说免费帮你测试肤质的(￣▽￣)／千万注意，入坑这是要推荐高价三无产品给你了，好了，再讲个就是人特别多，建议晚上去逛比较好，早上也OK啦，但是就是热，广州很热的，现在上下九东西也都蛮便宜，偶尔都会过去逛逛哈哈",
    overallScore: NumberInt("3"),
    viewScore: NumberInt("3"),
    uniqueScore: NumberInt("2"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf31005c972e5e8c4cb3ed"),
            parentId: "5ddf27745c972e4aa8a148d3",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T02:29:20.925Z"),
            content: "来广州一年了,还没去过,时间最合适去",
            uid: NumberLong("-1")
        }
    ],
    pics: [
        "/9bce6355-eb50-4c24-9143-834d5281d941.jpg/",
        "/1a14f686-a24d-4269-84d5-449542487b0f.jpg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf27bc5c972e4aa8a148d5"),
    scenicId: NumberLong("4"),
    scenicName: "上下九步行街",
    scenicImg: "/ccb1fac8-8ab3-483d-9a2b-9645e924ec16.jpg",
    userId: NumberLong("19"),
    username: "肚子好饿啊",
    level: NumberInt("1"),
    headUrl: "/qaz6.jpg",
    createTime: ISODate("2019-11-28T01:49:48.933Z"),
    content: "去完沙面（来广州必去之地），再去上下九，一路玩过来最好。\n\n从沙面岛出来，走过横跨六二三路的人行天桥，到马路对面广州市中医院旁的十八甫路，往北走约10分钟，就可以到上下九。（到达位置：皇上皇腊味、广州酒家附近）\n\n通常逛上下九，可以荔湾广场为起点，沿途华林玉器广场（以前的玉器墟），华林禅寺（达摩祖师西来初地），皇上皇腊味专卖店，广州酒家。\n\n然后顺着下九路往西走到第十甫路，宝华路，路过，莲香楼、陶陶居，可一路吃西关四大小吃：伍湛记状元及弟粥，欧成记的竹竿打面（虾仁云吞面，牛腩捞面），南信双皮奶（还有很多甜品），顺记冰室（椰子雪糕，布拉肠），陈添记鱼皮。\n\n从宝华路口可以继续往西走，走到恩宁路，可以看到广州最原汁原味的骑楼群，也是很多外地朋友都不知道经常找错的网红拍照地，粤剧博物馆、八和会馆，永庆坊，都在这里。",
    overallScore: NumberInt("5"),
    viewScore: NumberInt("4"),
    uniqueScore: NumberInt("4"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf30245c972e5e8c4cb3e6"),
            parentId: "5ddf27bc5c972e4aa8a148d5",
            userId: NumberLong("18"),
            headUrl: "/qaz1.jpg",
            username: "打死不加班",
            createTime: ISODate("2019-11-28T02:25:40.923Z"),
            content: "附近有地铁能到吗",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf30ca5c972e5e8c4cb3eb"),
            parentId: "5ddf27bc5c972e4aa8a148d5",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T02:28:26.449Z"),
            content: "吃的确实很多",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf30da5c972e5e8c4cb3ec"),
            parentId: "5ddf27bc5c972e4aa8a148d5",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T02:28:42.787Z"),
            content: "有的,2号线",
            uid: NumberLong("-1"),
            uname: "打死不加班"
        }
    ],
    pics: [
        "/499fb41d-36fd-4335-ab20-4d42039d1d80.jpeg/",
        "/3dc4c4ca-7583-43bc-a857-ca16c140cf91.jpeg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf285f5c972e4aa8a148d6"),
    scenicId: NumberLong("5"),
    scenicName: "越秀公园",
    scenicImg: "/0302647c-82e3-4ec3-ab5e-4dea87938878.jpg",
    userId: NumberLong("19"),
    username: "肚子好饿啊",
    level: NumberInt("1"),
    headUrl: "/qaz6.jpg",
    createTime: ISODate("2019-11-28T01:52:31.057Z"),
    content: "满园春色关不住。水上的大型花灯，色彩斑斓，晚上一定更美。路边开满了郁金香，加上阳光很好，哪里让人想到现在是腊月。可爱的动物造型花灯，我们发现这里的花灯是自贡的花灯公司承接制造的，原来自贡花灯这么有名气啦。越秀公园另一个标志就是这个五羊石像啦。从花灯展区走到这里真是豁出去半条命……天热路又远……\n在越秀公园五羊石像不远处，还有中山纪念碑，我们也趁此机会瞻仰了总理遗嘱，缅怀了这位伟人。",
    overallScore: NumberInt("4"),
    viewScore: NumberInt("4"),
    uniqueScore: NumberInt("4"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("1"),
    thumbuplist: [
        null
    ],
    refComment: [
        {
            _id: ObjectId("5ddf30b75c972e5e8c4cb3e9"),
            parentId: "5ddf285f5c972e4aa8a148d6",
            userId: NumberLong("18"),
            headUrl: "/qaz1.jpg",
            username: "打死不加班",
            createTime: ISODate("2019-11-28T02:28:07.626Z"),
            content: "要门票吗\n",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf30b85c972e5e8c4cb3ea"),
            parentId: "5ddf285f5c972e4aa8a148d6",
            userId: NumberLong("18"),
            headUrl: "/qaz1.jpg",
            username: "打死不加班",
            createTime: ISODate("2019-11-28T02:28:08.294Z"),
            content: "",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf312f5c972e5e8c4cb3ee"),
            parentId: "5ddf285f5c972e4aa8a148d6",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T02:30:07.27Z"),
            content: "要的,比较便宜",
            uid: NumberLong("-1"),
            uname: "打死不加班"
        }
    ],
    pics: [
        "/80f9fd46-9bdc-40f9-b926-3a75af5f3644.jpg/",
        "/9b67a0f6-4b6b-4dce-b8ce-7226bd5247cd.jpeg/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf32c45c972e5e8c4cb3ef"),
    scenicId: NumberLong("6"),
    scenicName: "白云山",
    scenicImg: "/e61595e6-0671-4e25-ba1c-4ad7a387b031.jpg",
    userId: NumberLong("1"),
    username: "琉璃",
    level: NumberInt("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    createTime: ISODate("2019-11-28T02:36:52.421Z"),
    content: "白云山就在在广州城北，旅游一号线到白云山下的停车场。白云山的缆车是在景区外面，往上爬一段才到售票处，如果爬到售票处还想坐缆车的话只能在原路返回。缆车是25元到山顶广场，包含门票。门票5元。爬山的路程中有一条往山顶广场和杨家岭的岔道，我选了杨家岭，打算回来的时候在到山顶广场，不走重复的路。2点40开始爬山，一条小道很窄，沿着山体慢慢往里延伸。山上有一处溪水汇聚成一处小水渠，水非常清澈。有的地方可以看到远处的广州城，不过天气不济。沿路一直向山顶，往摩星岭走，先爬上一个上坡接着一个下坡就到售票处了。摩星岭是在白云山中的一个公园，门票5元。是白云山的最高峰，其实爬的也并不高。往上爬一会有一个写祈愿牌同心锁的地方。其实最高只有382米，还有一个牌子写着离北京1900KM，心系首都呀。到达山顶广场，这就是羊城八景的白云望晚。白云山好像是24小时开放，晚上也可以来。远处隐隐约约能看到金融中心和广州塔。",
    overallScore: NumberInt("3"),
    viewScore: NumberInt("3"),
    uniqueScore: NumberInt("3"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf32f95c972e5e8c4cb3f0"),
            parentId: "5ddf32c45c972e5e8c4cb3ef",
            userId: NumberLong("17"),
            headUrl: "/qaz7.jpg",
            username: "猜猜我是谁",
            createTime: ISODate("2019-11-28T02:37:45.963Z"),
            content: "开车去的话，南门那边有停车的地方嘛？",
            uid: NumberLong("-1")
        }
    ],
    pics: [
        "/7fe632bd-7fb2-470f-b2f2-95860fc2d7d2.png/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf35655c972e5e8c4cb3f1"),
    scenicId: NumberLong("2"),
    scenicName: "广州塔",
    scenicImg: "/8b4b32bc-c2d5-4c36-9f69-98fc8a560557.jpg",
    userId: NumberLong("15"),
    username: "前端小王子",
    level: NumberInt("1"),
    headUrl: "/qaz9.jpg",
    createTime: ISODate("2019-11-28T02:48:05.027Z"),
    content: "好嗨哦",
    overallScore: NumberInt("4"),
    viewScore: NumberInt("3"),
    uniqueScore: NumberInt("4"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [ ],
    pics: [
        "/185a6383-385e-4e94-af61-00730840cc97.png/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf35fe5c972e5e8c4cb3f2"),
    scenicId: NumberLong("2"),
    scenicName: "广州塔",
    scenicImg: "/8b4b32bc-c2d5-4c36-9f69-98fc8a560557.jpg",
    userId: NumberLong("15"),
    username: "前端小王子",
    level: NumberInt("1"),
    headUrl: "/qaz9.jpg",
    createTime: ISODate("2019-11-28T02:50:38.934Z"),
    content: "起码可以360度看看整个城市的景色，能看得到下面的珠江。 至于什么白云观景大厅，星空观景大厅，真是挺无聊的，只不过是屋顶的天棚是蓝天白云的装饰风格和星空的装饰风格而已，人很多，闹哄哄的",
    overallScore: NumberInt("2"),
    viewScore: NumberInt("3"),
    uniqueScore: NumberInt("3"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf6bf25c972e70643e354c"),
            parentId: "5ddf35fe5c972e5e8c4cb3f2",
            userId: NumberLong("1"),
            headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
            username: "琉璃",
            createTime: ISODate("2019-11-28T06:40:50.326Z"),
            content: "OH~~~~~",
            uid: NumberLong("-1")
        }
    ],
    pics: [
        "/889ae474-3473-4007-b295-1c719b822541.png/",
        "/3b541373-2922-443b-a9ff-78374c1c494d.png/"
    ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf367e5c972e5e8c4cb3f3"),
    scenicId: NumberLong("6"),
    scenicName: "白云山",
    scenicImg: "/e61595e6-0671-4e25-ba1c-4ad7a387b031.jpg",
    userId: NumberLong("15"),
    username: "前端小王子",
    level: NumberInt("1"),
    headUrl: "/qaz9.jpg",
    createTime: ISODate("2019-11-28T02:52:46.089Z"),
    content: "啦啦啦啦啦啦啦",
    overallScore: NumberInt("3"),
    viewScore: NumberInt("4"),
    uniqueScore: NumberInt("4"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [
        {
            _id: ObjectId("5ddf368b5c972e5e8c4cb3f4"),
            parentId: "5ddf367e5c972e5e8c4cb3f3",
            userId: NumberLong("15"),
            headUrl: "/qaz9.jpg",
            username: "前端小王子",
            createTime: ISODate("2019-11-28T02:52:59.397Z"),
            content: "啦你个鬼",
            uid: NumberLong("-1")
        },
        {
            _id: ObjectId("5ddf36b05c972e5e8c4cb3f5"),
            parentId: "5ddf367e5c972e5e8c4cb3f3",
            userId: NumberLong("15"),
            headUrl: "/qaz9.jpg",
            username: "前端小王子",
            createTime: ISODate("2019-11-28T02:53:36.532Z"),
            content: "大叔大婶",
            uid: NumberLong("-1"),
            uname: "前端小王子"
        }
    ],
    pics: [ ]
} ]);
db.getCollection("scenic_comment").insert([ {
    _id: ObjectId("5ddf6bd75c972e70643e354b"),
    scenicId: NumberLong("2"),
    scenicName: "广州塔",
    scenicImg: "/8b4b32bc-c2d5-4c36-9f69-98fc8a560557.jpg",
    userId: NumberLong("1"),
    username: "琉璃",
    level: NumberInt("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    createTime: ISODate("2019-11-28T06:40:23.936Z"),
    content: "HELLO",
    overallScore: NumberInt("2"),
    serviceScore: NumberInt("0"),
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ],
    refComment: [ ],
    pics: [
        "/b80d3c87-a617-40e0-8c7a-904c57f3ee0d.jpg/"
    ]
} ]);

// ----------------------------
// Collection structure for scenic_comment_reply
// ----------------------------
db.getCollection("scenic_comment_reply").drop();
db.createCollection("scenic_comment_reply");

// ----------------------------
// Documents of scenic_comment_reply
// ----------------------------
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf20535c972e4aa8a148c3"),
    parentId: "5ddf1f7a5c972e4aa8a148c2",
    userId: NumberLong("2"),
    headUrl: "/images/default.png",
    username: "bunny",
    createTime: ISODate("2019-11-28T01:18:11.405Z"),
    content: "你好,请问交通方便吗?",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf20625c972e4aa8a148c4"),
    parentId: "5ddf1ec85c972e4aa8a148c1",
    userId: NumberLong("2"),
    headUrl: "/images/default.png",
    username: "bunny",
    createTime: ISODate("2019-11-28T01:18:26.631Z"),
    content: "看起来很美",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf21ac5c972e4aa8a148c7"),
    parentId: "5ddf214f5c972e4aa8a148c6",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T01:23:56.737Z"),
    content: "什么时候去合适啊?听说有摩天轮可以坐",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf21c95c972e4aa8a148c8"),
    parentId: "5ddf20a25c972e4aa8a148c5",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T01:24:25.781Z"),
    content: "照片也太贵了吧,坑",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf21df5c972e4aa8a148c9"),
    parentId: "5ddf1f7a5c972e4aa8a148c2",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T01:24:47.998Z"),
    content: "交通很方便的,有直达的地铁",
    uid: NumberLong("-1"),
    uname: "bunny"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf22015c972e4aa8a148ca"),
    parentId: "5ddf1ec85c972e4aa8a148c1",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T01:25:21.982Z"),
    content: "是的,毕竟是标志性建筑",
    uid: NumberLong("-1"),
    uname: "bunny"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf225a5c972e4aa8a148cb"),
    parentId: "5ddf214f5c972e4aa8a148c6",
    userId: NumberLong("2"),
    headUrl: "/qaz4.jpg",
    username: "bunny",
    createTime: ISODate("2019-11-28T01:26:50.496Z"),
    content: "晚上去最好,有夜景可以看",
    uid: NumberLong("-1"),
    uname: "琉璃"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf22715c972e4aa8a148cc"),
    parentId: "5ddf20a25c972e4aa8a148c5",
    userId: NumberLong("2"),
    headUrl: "/qaz4.jpg",
    username: "bunny",
    createTime: ISODate("2019-11-28T01:27:13.647Z"),
    content: "是的,主要是照片质量也很差",
    uid: NumberLong("-1"),
    uname: "琉璃"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf228b5c972e4aa8a148cd"),
    parentId: "5ddf1f7a5c972e4aa8a148c2",
    userId: NumberLong("2"),
    headUrl: "/qaz4.jpg",
    username: "bunny",
    createTime: ISODate("2019-11-28T01:27:39.734Z"),
    content: "坐哪一路地铁啊",
    uid: NumberLong("-1"),
    uname: "琉璃"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf22a05c972e4aa8a148ce"),
    parentId: "5ddf1f7a5c972e4aa8a148c2",
    userId: NumberLong("2"),
    headUrl: "/qaz4.jpg",
    username: "bunny",
    createTime: ISODate("2019-11-28T01:28:00.213Z"),
    content: "找到了,哈哈,出发",
    uid: NumberLong("-1"),
    uname: "琉璃"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf22b85c972e4aa8a148cf"),
    parentId: "5ddf1ec85c972e4aa8a148c1",
    userId: NumberLong("2"),
    headUrl: "/qaz4.jpg",
    username: "bunny",
    createTime: ISODate("2019-11-28T01:28:24.582Z"),
    content: "是滴是滴",
    uid: NumberLong("-1"),
    uname: "琉璃"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf2ec05c972e5e8c4cb3e0"),
    parentId: "5ddf1f7a5c972e4aa8a148c2",
    userId: NumberLong("20"),
    headUrl: "/qaz10.jpg",
    username: "想放假的小明",
    createTime: ISODate("2019-11-28T02:19:44.263Z"),
    content: "哪都有哪路公交车能到啊",
    uid: NumberLong("-1"),
    uname: "bunny"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf2f0e5c972e5e8c4cb3e1"),
    parentId: "5ddf214f5c972e4aa8a148c6",
    userId: NumberLong("20"),
    headUrl: "/qaz10.jpg",
    username: "想放假的小明",
    createTime: ISODate("2019-11-28T02:21:02.774Z"),
    content: "那晚上去人是不是很多啊,排队需要多久啊",
    uid: NumberLong("-1"),
    uname: "bunny"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf2f155c972e5e8c4cb3e2"),
    parentId: "5ddf214f5c972e4aa8a148c6",
    userId: NumberLong("20"),
    headUrl: "/qaz10.jpg",
    username: "想放假的小明",
    createTime: ISODate("2019-11-28T02:21:09.254Z"),
    content: "",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf2fb65c972e5e8c4cb3e3"),
    parentId: "5ddf26d65c972e4aa8a148d2",
    userId: NumberLong("18"),
    headUrl: "/qaz1.jpg",
    username: "打死不加班",
    createTime: ISODate("2019-11-28T02:23:50.424Z"),
    content: "人多吗,排队得等多久啊",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf2fd25c972e5e8c4cb3e4"),
    parentId: "5ddf26415c972e4aa8a148d1",
    userId: NumberLong("18"),
    headUrl: "/qaz1.jpg",
    username: "打死不加班",
    createTime: ISODate("2019-11-28T02:24:18.958Z"),
    content: "进去需要单独再买门票吗",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf2fe05c972e5e8c4cb3e5"),
    parentId: "5ddf26d65c972e4aa8a148d2",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T02:24:32.481Z"),
    content: "多,周末和节假日更多",
    uid: NumberLong("-1"),
    uname: "打死不加班"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf30245c972e5e8c4cb3e6"),
    parentId: "5ddf27bc5c972e4aa8a148d5",
    userId: NumberLong("18"),
    headUrl: "/qaz1.jpg",
    username: "打死不加班",
    createTime: ISODate("2019-11-28T02:25:40.923Z"),
    content: "附近有地铁能到吗",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf30355c972e5e8c4cb3e7"),
    parentId: "5ddf26415c972e4aa8a148d1",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T02:25:57.869Z"),
    content: "看你买什么票了,普通票,想玩水上乐园需要额外买票",
    uid: NumberLong("-1"),
    uname: "打死不加班"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf304e5c972e5e8c4cb3e8"),
    parentId: "5ddf25f85c972e4aa8a148d0",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T02:26:22.107Z"),
    content: "是的,是一个周末好去处",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf30b75c972e5e8c4cb3e9"),
    parentId: "5ddf285f5c972e4aa8a148d6",
    userId: NumberLong("18"),
    headUrl: "/qaz1.jpg",
    username: "打死不加班",
    createTime: ISODate("2019-11-28T02:28:07.626Z"),
    content: "要门票吗\n",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf30b85c972e5e8c4cb3ea"),
    parentId: "5ddf285f5c972e4aa8a148d6",
    userId: NumberLong("18"),
    headUrl: "/qaz1.jpg",
    username: "打死不加班",
    createTime: ISODate("2019-11-28T02:28:08.294Z"),
    content: "",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf30ca5c972e5e8c4cb3eb"),
    parentId: "5ddf27bc5c972e4aa8a148d5",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T02:28:26.449Z"),
    content: "吃的确实很多",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf30da5c972e5e8c4cb3ec"),
    parentId: "5ddf27bc5c972e4aa8a148d5",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T02:28:42.787Z"),
    content: "有的,2号线",
    uid: NumberLong("-1"),
    uname: "打死不加班"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf31005c972e5e8c4cb3ed"),
    parentId: "5ddf27745c972e4aa8a148d3",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T02:29:20.925Z"),
    content: "来广州一年了,还没去过,时间最合适去",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf312f5c972e5e8c4cb3ee"),
    parentId: "5ddf285f5c972e4aa8a148d6",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T02:30:07.27Z"),
    content: "要的,比较便宜",
    uid: NumberLong("-1"),
    uname: "打死不加班"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf32f95c972e5e8c4cb3f0"),
    parentId: "5ddf32c45c972e5e8c4cb3ef",
    userId: NumberLong("17"),
    headUrl: "/qaz7.jpg",
    username: "猜猜我是谁",
    createTime: ISODate("2019-11-28T02:37:45.963Z"),
    content: "开车去的话，南门那边有停车的地方嘛？",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf368b5c972e5e8c4cb3f4"),
    parentId: "5ddf367e5c972e5e8c4cb3f3",
    userId: NumberLong("15"),
    headUrl: "/qaz9.jpg",
    username: "前端小王子",
    createTime: ISODate("2019-11-28T02:52:59.397Z"),
    content: "啦你个鬼",
    uid: NumberLong("-1")
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf36b05c972e5e8c4cb3f5"),
    parentId: "5ddf367e5c972e5e8c4cb3f3",
    userId: NumberLong("15"),
    headUrl: "/qaz9.jpg",
    username: "前端小王子",
    createTime: ISODate("2019-11-28T02:53:36.532Z"),
    content: "大叔大婶",
    uid: NumberLong("-1"),
    uname: "前端小王子"
} ]);
db.getCollection("scenic_comment_reply").insert([ {
    _id: ObjectId("5ddf6bf25c972e70643e354c"),
    parentId: "5ddf35fe5c972e5e8c4cb3f2",
    userId: NumberLong("1"),
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    username: "琉璃",
    createTime: ISODate("2019-11-28T06:40:50.326Z"),
    content: "OH~~~~~",
    uid: NumberLong("-1")
} ]);

// ----------------------------
// Collection structure for strategy_comment
// ----------------------------
db.getCollection("strategy_comment").drop();
db.createCollection("strategy_comment");

// ----------------------------
// Documents of strategy_comment
// ----------------------------
db.getCollection("strategy_comment").insert([ {
    _id: ObjectId("5dce4980bab63757dcc71821"),
    detailId: NumberLong("2"),
    detailTitle: "有娃必看，广州长隆野生动物园全攻略",
    userId: NumberLong("1"),
    username: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    createTime: ISODate("2019-11-15T06:45:20.977Z"),
    content: "哒哒哒",
    thumbupnum: NumberInt("1"),
    thumbuplist: [
        NumberLong("1")
    ]
} ]);
db.getCollection("strategy_comment").insert([ {
    _id: ObjectId("5dd0b649bab63757c0500259"),
    detailId: NumberLong("2"),
    detailTitle: "有娃必看，广州长隆野生动物园全攻略",
    userId: NumberLong("1"),
    username: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    createTime: ISODate("2019-11-17T02:54:01.248Z"),
    content: "咯咯咯",
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("strategy_comment").insert([ {
    _id: ObjectId("5dd0b900bab63757c050025a"),
    detailId: NumberLong("2"),
    detailTitle: "有娃必看，广州长隆野生动物园全攻略",
    userId: NumberLong("1"),
    username: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    createTime: ISODate("2019-11-17T03:05:36.616Z"),
    content: "吱吱吱",
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ]
} ]);
db.getCollection("strategy_comment").insert([ {
    _id: ObjectId("5dd0bafdbab63757c050025b"),
    detailId: NumberLong("2"),
    detailTitle: "有娃必看，广州长隆野生动物园全攻略",
    userId: NumberLong("1"),
    username: "逍遥",
    level: NumberInt("1"),
    headUrl: "/images/xiaoyao.jpg",
    createTime: ISODate("2019-11-17T03:14:05.867Z"),
    content: "揉揉揉",
    thumbupnum: NumberInt("0"),
    thumbuplist: [ ]
} ]);

// ----------------------------
// Collection structure for travel_comment
// ----------------------------
db.getCollection("travel_comment").drop();
db.createCollection("travel_comment");

// ----------------------------
// Documents of travel_comment
// ----------------------------
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dce367cbab63757dcc7181d"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    type: NumberInt("0"),
    createTime: ISODate("2019-11-15T05:24:12.569Z"),
    content: "特别好吃",
    refComment: {
        _id: "",
        type: NumberInt("0")
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dce36c3bab63757dcc7181e"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    type: NumberInt("0"),
    createTime: ISODate("2019-11-15T05:25:23.147Z"),
    content: "挺好吃的",
    refComment: {
        _id: "",
        type: NumberInt("0")
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dce374fbab63757dcc7181f"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    type: NumberInt("1"),
    createTime: ISODate("2019-11-15T05:27:43.329Z"),
    content: "真的嘛",
    refComment: {
        _id: ObjectId("5dce36c3bab63757dcc7181e"),
        travelId: NumberLong("1"),
        travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
        userId: NumberLong("1"),
        username: "逍遥",
        headUrl: "/images/xiaoyao.jpg",
        type: NumberInt("0"),
        createTime: ISODate("2019-11-15T05:25:23.147Z"),
        content: "挺好吃的",
        refComment: {
            _id: "",
            type: NumberInt("0")
        }
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dce375ebab63757dcc71820"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    type: NumberInt("1"),
    createTime: ISODate("2019-11-15T05:27:58.795Z"),
    content: "我不信",
    refComment: {
        _id: ObjectId("5dce36c3bab63757dcc7181e"),
        travelId: NumberLong("1"),
        travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
        userId: NumberLong("1"),
        username: "逍遥",
        headUrl: "/images/xiaoyao.jpg",
        type: NumberInt("0"),
        createTime: ISODate("2019-11-15T05:25:23.147Z"),
        content: "挺好吃的",
        refComment: {
            _id: "",
            type: NumberInt("0")
        }
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dce5669bab6371c94be1b03"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    city: "广州",
    type: NumberInt("1"),
    createTime: ISODate("2019-11-15T07:40:25.378Z"),
    content: "我觉得是真的",
    refComment: {
        _id: ObjectId("5dce374fbab63757dcc7181f"),
        travelId: NumberLong("1"),
        travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
        userId: NumberLong("1"),
        username: "逍遥",
        headUrl: "/images/xiaoyao.jpg",
        type: NumberInt("1"),
        createTime: ISODate("2019-11-15T05:27:43.329Z"),
        content: "真的嘛",
        refComment: {
            _id: ObjectId("5dce36c3bab63757dcc7181e"),
            travelId: NumberLong("1"),
            travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
            userId: NumberLong("1"),
            username: "逍遥",
            headUrl: "/images/xiaoyao.jpg",
            type: NumberInt("0"),
            createTime: ISODate("2019-11-15T05:25:23.147Z"),
            content: "挺好吃的",
            refComment: {
                _id: "",
                type: NumberInt("0")
            }
        }
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dce5805bab6371c94be1b04"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    city: "广州",
    type: NumberInt("0"),
    createTime: ISODate("2019-11-15T07:47:17.769Z"),
    content: "i67",
    refComment: {
        _id: "",
        type: NumberInt("0")
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dceb2c8bab63761a8eba266"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    city: "广州",
    type: NumberInt("0"),
    createTime: ISODate("2019-11-15T14:14:32.312Z"),
    content: "我就看看",
    refComment: {
        _id: "",
        type: NumberInt("0")
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dceb2dcbab63761a8eba267"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    city: "广州",
    type: NumberInt("0"),
    createTime: ISODate("2019-11-15T14:14:52.542Z"),
    content: "再看看",
    refComment: {
        _id: "",
        type: NumberInt("0")
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dd006d8bab63765204488f6"),
    travelId: NumberLong("1"),
    travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    city: "广州",
    type: NumberInt("1"),
    createTime: ISODate("2019-11-16T14:25:28.464Z"),
    content: "看你麻痹",
    refComment: {
        _id: ObjectId("5dceb2dcbab63761a8eba267"),
        travelId: NumberLong("1"),
        travelTitle: "广州三天三夜|跟随必字榜吃喝玩乐耍",
        userId: NumberLong("1"),
        username: "逍遥",
        headUrl: "/images/xiaoyao.jpg",
        city: "广州",
        type: NumberInt("0"),
        createTime: ISODate("2019-11-15T14:14:52.542Z"),
        content: "再看看",
        refComment: {
            _id: "",
            type: NumberInt("0")
        }
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dd4e8d45c972e6becc8c25c"),
    travelId: NumberLong("4"),
    travelTitle: "摩登而复古，旖旎又深沉，梦幻到极致",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    city: "广州",
    type: NumberInt("0"),
    createTime: ISODate("2019-11-20T07:18:44.003Z"),
    content: "拥抱可爱的Sanrio伙伴",
    refComment: {
        _id: "",
        type: NumberInt("0")
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5dd8d01a91a000333c9a0c78"),
    travelId: NumberLong("12"),
    travelTitle: "格鲁吉亚：与它爱恨纠葛，犹述一书武侠情愁。来饮壶好酒？",
    userId: NumberLong("1"),
    username: "逍遥",
    headUrl: "/images/xiaoyao.jpg",
    city: "广州",
    type: NumberInt("0"),
    createTime: ISODate("2019-11-23T06:22:18.167Z"),
    content: "阿拉啦啦啦",
    refComment: {
        _id: "",
        type: NumberInt("0")
    }
} ]);
db.getCollection("travel_comment").insert([ {
    _id: ObjectId("5ddf27785c972e4aa8a148d4"),
    travelId: NumberLong("12"),
    travelTitle: "格鲁吉亚：与它爱恨纠葛，犹述一书武侠情愁。来饮壶好酒？",
    userId: NumberLong("1"),
    username: "琉璃",
    headUrl: "/31129869-a745-471d-9cd8-6de6ea8b64ef.jpg",
    city: "广州",
    type: NumberInt("1"),
    createTime: ISODate("2019-11-28T01:48:40.026Z"),
    content: "哇!!!!好漂亮啊",
    refComment: {
        _id: ObjectId("5dd8d01a91a000333c9a0c78"),
        travelId: NumberLong("12"),
        travelTitle: "格鲁吉亚：与它爱恨纠葛，犹述一书武侠情愁。来饮壶好酒？",
        userId: NumberLong("1"),
        username: "逍遥",
        headUrl: "/images/xiaoyao.jpg",
        city: "广州",
        type: NumberInt("0"),
        createTime: ISODate("2019-11-23T06:22:18.167Z"),
        content: "阿拉啦啦啦",
        refComment: {
            _id: "",
            type: NumberInt("0")
        }
    }
} ]);
