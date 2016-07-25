module Gpe; module Agent; module Vmware; module Helpers

  def make_key( len=2 )
    key = []
    len.times{ key << generate_key }
    return key.join("-")
  end

  def generate_key
    return ('a'..'z').to_a.shuffle[0..3].join
  end

end; end; end; end
