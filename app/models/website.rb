class Website < ApplicationRecord
  validates_presence_of :title

  def image
    Docker::Image.get(image_name)
  end

  def pull

  end

  def run
    opts = JSON.parse(run_options)
    container = image.run(run_command, opts)
    puts container.to_s
    self.container_id = container.id
    self.save
  end

  def container
    if running?
      return Docker::Container.get(self.container_id)
    end
    return nil
  end

  def stop
    container = Docker::Container.get(container_id)
    container.stop
    container.delete
    self.container_id = nil
    self.save
  end

  def url
    port_bindings = run_options[:HostConfig][:PortBindings]
    port = ''
    port_bindings.each do |k,v|
      port = v[0]
    end
    return port
  end

  def running?
    if self.container_id.to_s != ''
      return true
    end
    return false
  end

  def stats
    if running?
      return container.stats
    end

    return nil
  end
end
