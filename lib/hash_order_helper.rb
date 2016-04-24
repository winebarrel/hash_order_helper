module HashOrderHelper
  def sort_pair
    new_hash = {}

    self.sort_by(&:to_s).each do |k, v|
      new_hash[k] = v
    end

    new_hash
  end

  def sort_pair!
    self.replace(self.sort_pair)
  end

  def sort_pair_by(&block)
    new_hash = {}

    self.sort_by(&block).each do |k, v|
      new_hash[k] = v
    end

    new_hash
  end

  def sort_pair_by!(&block)
    self.replace(self.sort_pair_by(&block))
  end

  def at(nth)
    self.to_a.at(nth)
  end

  def insert(nth, insert_hash)
    hash_keys = self.keys
    hash_keys.insert(nth, *insert_hash.keys)
    new_hash = {}

    hash_keys.each do |key|
      value = insert_hash.has_key?(key) ? insert_hash[key] : self[key]
      new_hash[key] = value
    end

    self.replace(new_hash)
  end

  def last(n = nil)
    if n.nil?
      self.to_a.last
    else
      self.to_a.last(n)
    end
  end

  def pop(n = nil)
    ary = self.to_a
    last_values = n.nil? ? ary.pop : ary.pop(n)
    new_hash = {}

    ary.each do |k, v|
      new_hash[k] = v
    end

    self.replace(new_hash)
    last_values
  end

  def nd_push(push_hash)
    hash_keys = self.keys - push_hash.keys
    hash_keys.push(*push_hash.keys)
    new_hash = {}
    hash_keys.each do |key|
      value = push_hash.has_key?(key) ? push_hash[key] : self[key]
      new_hash[key] = value
    end

    new_hash
  end
  alias < nd_push

  def push(push_hash)
    new_hash = nd_push(push_hash)
    self.replace(new_hash)
  end
  alias << push

  def nd_unshift(unshift_hash)
    hash_keys = self.keys - unshift_hash.keys
    hash_keys.unshift(*unshift_hash.keys)
    new_hash = {}

    hash_keys.each do |key|
      value = unshift_hash.has_key?(key) ? unshift_hash[key] : self[key]
      new_hash[key] = value
    end

    new_hash
  end

  def unshift(unshift_hash)
    new_hash = nd_unshift(unshift_hash)
    self.replace(new_hash)
  end

  def >>(receiver)
    unless receiver.is_a?(Hash)
      raise TypeError, "no implicit conversion of #{receiver.inspect}:#{receiver.class} into Hash"
    end

    receiver.unshift(self)
  end

  def >(receiver)
    unless receiver.is_a?(Hash)
      raise TypeError, "no implicit conversion of #{receiver.inspect}:#{receiver.class} into Hash"
    end

    receiver.nd_unshift(self)
  end
end
Hash.send(:prepend, HashOrderHelper)
