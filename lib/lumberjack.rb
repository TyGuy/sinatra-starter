require 'logger'

module Lumberjack
  def info(msg, data)
    logger.info(format_data(msg, data))
  end

  def error(msg, data)
    logger.error(format_data(msg, data))
  end

  def warn(msg, data)
    logger.warn(format_data(msg, data))
  end

  def debug(msg, data)
    logger.debug(format_data(msg, data))
  end

  private

  def logger
    @logger ||= Logger.new(STDOUT)
  end

  # data passed in should be a hash
  def format_data(msg, data)
    data_string = data.map { |k, v| "#{k}=#{v}" }.join(',')
    "#{msg} (#{data_string})"
  end
end
