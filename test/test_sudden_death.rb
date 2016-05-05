require 'test/unit'
require '../lib/sudden_death'

include SuddenDeath

class TestSuddenDeath < Test::Unit::TestCase
  sub_test_case 'input of short English only' do
    test 'input aaa' do
      assert_equal "＿人人人人人＿\n＞　aaa　＜\n￣Y^Y^Y^￣\n", SuddenDeath.generate('aaa')
    end
  end

  sub_test_case 'input of short Japanese only' do
    test 'input あああ' do
      assert_equal "＿人人人人人＿\n＞　あああ　＜\n￣Y^Y^Y^￣\n", SuddenDeath.generate('あああ')
    end
  end
end
