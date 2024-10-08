package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"short_url/config"
	"short_url/http/middleware"
	"short_url/lib"
	"short_url/logic/controller"
)

func main() {
	config.InitLocal()
	//初始化数据库
	lib.InitDB()
	//初始化redis
	lib.InitRedis()

	r := gin.Default()
	//处理跨域
	r.Use(middleware.Cors())

	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "welcome",
		})
	})
	r.StaticFile("/robots.txt", "robots.txt")
	rAuth := r.Group("/api/").Use(middleware.Auth())
	{
		rAuth.POST("url", controller.Url.Cov)
		rAuth.GET("url", controller.Url.Rcov)
		rAuth.PUT("url", controller.Url.UpdateCov)
		rAuth.DELETE("url", controller.Url.DeleteCov)
	}
	r.GET("/:code", middleware.Visit(), controller.Url.Trans)
	r.Run(":" + config.ServicePort)
}
