# -*- encoding : utf-8 -*-
require 'resque_scheduler/server'

Resque.redis = "localhost:6379"
Resque.redis.namespace = ENV["REDIS_NAMESPACE"]
Resque::Plugins::Status::Hash.expire_in = (24 * 60 * 60)