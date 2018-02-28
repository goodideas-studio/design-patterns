package com.androidcamp.goodideas.monsterhunter

import android.os.Bundle
import android.support.design.widget.BottomNavigationView
import android.support.v4.app.Fragment
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.ImageView
import android.widget.Toast
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.view.pack.PackFragment
import com.androidcamp.goodideas.monsterhunter.view.shop.ShopFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {





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


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val img_boss = findViewById<ImageView>(R.id.img_boss)
        val img_sword = findViewById<ImageView>(R.id.ib_sword)


        val transition = supportFragmentManager.beginTransaction()
        transition.replace(R.id.container, selectedFragment)
        transition.commit()

        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener)
    }

}

