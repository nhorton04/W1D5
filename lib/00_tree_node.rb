class PolyTreeNode
  attr_reader :parent, :value, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(new_parent)
    if self.parent # = 1 
      @parent.children.delete(self) if @parent.children.include?(self)#check to see if self is in .children, and if so, delete.
    end
    @parent = new_parent #self = node2 parent = node1 [node2, ] 
    return nil if self.parent.nil?
    @parent.children << self unless @parent.children.include?(self)
  end
  
  def add_child(child)
    child.parent = self 
  end
  
  def remove_child
    parent=(nil)
  end
  
  def inspect 
    "<value = #{@value}, parent = #{@parent}, children = #{@children}>"
  end
end 


# self = node3  parent = new_parent(node1), value = value, children = []