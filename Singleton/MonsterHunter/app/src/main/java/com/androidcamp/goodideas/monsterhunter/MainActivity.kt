package com.androidcamp.goodideas.monsterhunter

import android.os.Bundle
import android.support.design.widget.BottomNavigationView
import android.support.v4.app.Fragment
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.Toast
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.PackageView.PackFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {


    var bossHp = 10000
    var selectedFragment: Fragment = MainFragment()

    private val mOnNavigationItemSelectedListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->

        when (item.itemId) {
            R.id.navigation_home -> {
                selectedFragment = MainFragment()
            }
            R.id.navigation_package -> {
                selectedFragment = PackFragment()
            }
            R.id.navigation_shop -> {
                selectedFragment = ShopFragment()
            }
        }

        val transition = supportFragmentManager.beginTransaction()
        transition.replace(R.id.container, selectedFragment)
        transition.commit()

        true
    }

    private val ib_sword_click = View.OnClickListener{
        bossHp = bossHp -10
        Status.money = Status.money + 5
//        boss_hp.setText(bossHp.toString())
        Toast.makeText(this,"Boss lose 10 HP \n money add 5 coin", Toast.LENGTH_SHORT).show()
//        tv_money.setText(status.money.toString())


    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        Status.money = 100
        Status.hp = 100
        Status.mp = 100

//        tv_money.setText(status.money.toString())
//
  //      ib_sword.setOnClickListener(ib_sword_click)

        val transition = supportFragmentManager.beginTransaction()
        transition.replace(R.id.container, selectedFragment)
        transition.commit()

        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener)
    }

}

