package config

type Config struct {
	Server     ServerConfig
	Database   DatabaseConfig
	Redis      RedisConfig
	Blockchain BlockchainConfig
	IPFS       IPFSConfig
	JWT        JWTConfig
	RabbitMQ   RabbitMQConfig
}

type ServerConfig struct{}
type DatabaseConfig struct{}
type RedisConfig struct{}
type BlockchainConfig struct{}
type IPFSConfig struct{}
type JWTConfig struct{}
type RabbitMQConfig struct{}
