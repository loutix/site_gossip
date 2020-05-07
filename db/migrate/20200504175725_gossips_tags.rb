class GossipsTags < ActiveRecord::Migration[5.2]
  def change
  	create_table :gossips_tags do |t|
	  	t.belongs_to :tag
	  	t.belongs_to :gossip
	  	t.timestamp
	  end
  end
end
