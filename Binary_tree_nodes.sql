--Ques: You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
-- Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
-- Root: If node is root node , Leaf: If node is leaf node , Inner: If node is neither root nor leaf node.

with nodetype as (
  SELECT N,
    case
      when P is Null then "Root" 
      when N not in (select P from BST where P is not null) then "Leaf" 
      Else "Inner" 
    End as nt 
  from BST) 
  
select N, nt 
from nodetype 
order by N

--Logic: Root Condition: A node is the root if it has no parent. You can check this by seeing if P is null.
-- Leaf Condition: A node is a leaf if it has a parent (P is not null) but does not act as a parent to any other node (i.e., it does not appear in the P column).
