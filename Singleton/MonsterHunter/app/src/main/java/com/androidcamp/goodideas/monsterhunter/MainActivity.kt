package com.androidcamp.goodideas.monsterhunter

import android.content.Intent
import android.os.Bundle
import android.support.design.widget.BottomNavigationView
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    var bosshp = 10000

    private val mOnNavigationItemSelectedListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->
        when (item.itemId) {
            R.id.navigation_home -> {
                val intent = Intent(this,MainActivity::class.java)
                startActivity(intent)


                return@OnNavigationItemSelectedListener true
            }
            R.id.navigation_dashboard -> {
                val intent = Intent(this,PackActivity::class.java)
                startActivity(intent)
                return@OnNavigationItemSelectedListener true
            }
            R.id.navigation_notifications -> {
//                val intent = Intent(this,ShopActivity::class.java)
//                startActivity(intent)

                return@OnNavigationItemSelectedListener true
            }
        }
        false
    }

    private val ib_sword_click = View.OnClickListener{
        bosshp = bosshp -10
        status.money = status.money + 5
        boss_hp.setText(bosshp.toString())
        Toast.makeText(this,"Boss lose 10 HP \n money add 5 coin", Toast.LENGTH_SHORT).show()
        tv_money.setText(status.money.toString())


    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        status.money = 100
        status.hp = 100
        status.mp = 100


        tv_money.setText(status.money.toString())

        ib_sword.setOnClickListener(ib_sword_click)

        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener)
    }
}

object status{
    var money :Int = 0
    var hp :Int = 0
    var mp :Int = 0
}
