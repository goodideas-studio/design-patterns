package com.example.likunlin.game2

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.design.widget.BottomNavigationView
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentTransaction
import android.view.View
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.f_flagment_home.*

class MainActivity : AppCompatActivity() {

    enum class FragmentType {
        home, sword, notification
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val Fragmentmanager :FragmentManager
        val Frag_tran:FragmentTransaction
        val management =supportFragmentManager
        Frag_tran = management.beginTransaction()
        val frag_home = flagment_home()
        Frag_tran.add(R.,frag_home)

        initnavationview()

    }

    private val onnavigationclick = BottomNavigationView.OnNavigationItemSelectedListener{Menuitem ->

\

        when(Menuitem.itemId){
            R.id.item_home ->{

            }
            R.id.item_sword ->{
                Toast.makeText(this,"sword",Toast.LENGTH_SHORT).show()
            }
            R.id.item_sheild ->{
                Toast.makeText(this,"shield",Toast.LENGTH_SHORT).show()
            }
            R.id.item_magic ->{
                Toast.makeText(this,"magic",Toast.LENGTH_SHORT).show()
            }
        }
true

    }

    private fun initnavationview() {
        navigation.setOnNavigationItemSelectedListener(onnavigationclick)
    }


}
