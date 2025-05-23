require_relative 'test_helper'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe Tree do
  let (:tree) {Tree.new}

  let (:tree_with_nodes) {
    tree.add(5, "Peter")
    tree.add(3, "Paul")
    tree.add(1, "Mary")
    tree.add(10, "Karla")
    tree.add(15, "Ada")
    tree.add(25, "Kari")
    tree
  }

  it "add & find values" do
    tree.add(5, "Peter")
    expect(tree.find(5)).must_equal "Peter"

    tree.add(15, "Ada")
    expect(tree.find(15)).must_equal "Ada"

    tree.add(3, "Paul")
    expect(tree.find(3)).must_equal "Paul"
  end

  it "can't find anything when the tree is empty" do
    expect(tree.find(50)).must_be_nil
  end

  describe "inorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.inorder).must_equal []
    end

    it "will return the tree in order" do

      expect(tree_with_nodes.inorder).must_equal [{:key=>1, :value=>"Mary"}, {:key=>3, :value=>"Paul"}, 
                                       {:key=>5, :value=>"Peter"}, {:key=>10, :value=>"Karla"}, 
                                       {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end


  describe "preorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.preorder).must_equal []
    end

    it "will return the tree in preorder" do
      expect(tree_with_nodes.preorder).must_equal [{:key=>5, :value=>"Peter"}, {:key=>3, :value=>"Paul"}, 
                                        {:key=>1, :value=>"Mary"}, {:key=>10, :value=>"Karla"}, 
                                        {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end

  describe "postorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.postorder).must_equal []
    end

    it "will return the tree in postorder" do
      expect(tree_with_nodes.postorder).must_equal [{:key=>1, :value=>"Mary"}, {:key=>3, :value=>"Paul"}, 
                                         {:key=>25, :value=>"Kari"}, {:key=>15, :value=>"Ada"}, 
                                         {:key=>10, :value=>"Karla"}, {:key=>5, :value=>"Peter"}]
    end
  end

  describe "breadth first search" do
    it "will give an empty array for an empty tree" do
      expect(tree.bfs).must_equal []
    end

    it "will return an array of a level-by-level output of the tree" do
      expect(tree_with_nodes.bfs).must_equal [{:key=>5, :value=>"Peter"}, {:key=>3, :value=>"Paul"}, 
                                   {:key=>10, :value=>"Karla"}, {:key=>1, :value=>"Mary"}, 
                                   {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end

  describe "height" do
    it "will return 0 for an empty tree" do
      my_tree = Tree.new

      expect(my_tree.height).must_equal 0
    end

    it "will return 1 for a tree of height 1" do
      my_tree = Tree.new

      my_tree.add(100, 1)
      expect(my_tree.height).must_equal 1
    end

    it "will report the height for a tree with height 4 on right and 3 on left" do
      expect(tree_with_nodes.height).must_equal 4
    end

    it "will report the height for unbalanced trees" do
      my_tree = Tree.new

      my_tree.add(100, 1)
      my_tree.add(110, 1)
      my_tree.add(120, 1)
      my_tree.add(130, 1)
      my_tree.add(140, 1)

      expect(my_tree.height).must_equal 5

      my_tree = Tree.new

      my_tree = Tree.new

      my_tree.add(100, 1)
      my_tree.add(90, 1)
      my_tree.add(80, 1)
      my_tree.add(70, 1)
      my_tree.add(60, 1)

      expect(my_tree.height).must_equal 5
    end
  end
end
