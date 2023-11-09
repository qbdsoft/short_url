package main

import (
    "short_url/config"
    "short_url/lib"
    "short_url/logic/model"
)

func main() {
    config.InitLocal()
    //初始化数据库
    lib.InitDB()

    lib.MysqlClient.AutoMigrate(&model.ShortUrl{})
    lib.MysqlClient.AutoMigrate(&model.Auth{})

    //将字段字符集限定为大小写敏感
    model.ShortUrl{}.DB().Exec("alter table short_url  modify code char(6) collate utf8_bin not null comment '短链标识'")

    //testAuth := model.Auth{
    //    Key:    "test",
    //    Secret: "123456",
    //}
    //model.Auth{}.DB().Where(model.Auth{Key: "test"}).FirstOrCreate(&testAuth)
}
