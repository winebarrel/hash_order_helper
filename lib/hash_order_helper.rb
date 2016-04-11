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

  def push(push_hash)
    hash_keys = self.keys
    hash_keys.push(*push_hash.keys)
    new_hash = {}
    hash_keys.each do |key|
      value = push_hash.has_key?(key) ? push_hash[key] : self[key]
      new_hash[key] = value
    end

    self.replace(new_hash)
  end

  def unshift(new_key, new_value)
    hash_keys = self.keys
    hash_keys.unshift(new_key)
    new_hash = {}

    hash_keys.each do |key|
      value = (key == new_key) ? new_value : self[key]
      new_hash[key] = value
    end

    self.replace(new_hash)
  end
end
Hash.send(:include, HashOrderHelper)
