package config

import (
	"github.com/go-redis/redis/v8"
)

const (
	RedisConnNameDefault = "default"
)

type redisConfig struct {
	Name     string
	Addr     string
	Password string
	Config   interface{}
}

var (
	// RedisDefault 默认配置
	RedisDefault = redisConfig{
		Name:     RedisConnNameDefault,
		Addr:     "",
		Password: "",

		Config: redis.Options{
			DB: 0,
		},
	}
)
