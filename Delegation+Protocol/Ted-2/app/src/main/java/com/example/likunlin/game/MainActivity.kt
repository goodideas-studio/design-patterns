package com.example.likunlin.game

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    var worr_hp_1 = 100
    val worr_att = 100
    var boss_hp_1 = 2000
    val boss_att = 2000
    var worr_attack :String = ""
    var boss_attack :String = ""
    var WL :String = ""
    var FWL :String = ""


    private val bt_atk_click = View.OnClickListener{

        worr_attack = "attack"
        Bossrandom()
        WLSystom()


    }


    private val bt_def_click = View.OnClickListener{

        worr_attack = "def"
        Bossrandom()
        WLSystom()


    }

    private val bt_hitback_click = View.OnClickListener{

        worr_attack = "hitback"
        Bossrandom()
        WLSystom()

    }

    private val bt_switch_click = View.OnClickListener{

        changeMan()
    }

    private fun changeMan() {
        if(FWL == "Boss win"){

            worr_img.setImageResource(R.drawable.wolf)
            worr_hp_1 = 500
            worr_hp.setText(worr_hp_1.toString())

        }
        if(FWL ==  "warrior win"){
            boss_img.setImageResource(R.drawable.wolf)
            boss_hp_1 = 500
            boss_hp.setText(worr_hp_1.toString())

        }


    }


    private fun WLSystom() {
        if(worr_attack == boss_attack){
            tv_vs.setText("平手")
        }
        if(worr_attack =="attack" && boss_attack == "def" ||worr_attack =="def" && boss_attack == "hitback" ||worr_attack =="hitback" && boss_attack == "attack"){
            WL = "魔王勝"
           tv_vs.setText(WL)

        }
        if(worr_attack =="attack" && boss_attack == "hitback" ||worr_attack =="def" && boss_attack == "attack"||worr_attack =="hitback" && boss_attack == "def"){
            WL = "勇者勝"
            tv_vs.setText(WL)

        }

        checkhp()
    }

    private val bt_reset_click = View.OnClickListener{
        worr_hp_1 = 100
        worr_hp.setText(worr_hp_1.toString())
        boss_hp_1 = 2000
        boss_hp.setText(boss_hp_1.toString())


        bt_atk.isEnabled = true
        bt_def.isEnabled = true
        bt_hitback.isEnabled = true

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        bt_atk.setOnClickListener(bt_atk_click)
        bt_def.setOnClickListener(bt_def_click)
        bt_hitback.setOnClickListener(bt_hitback_click)
        bt_switch.setOnClickListener(bt_switch_click)
        bt_reset.setOnClickListener(bt_reset_click)

    }

    private fun Bossrandom() {
        var boss_attub :Int =((Math.random()*10000)%3).toInt()

        if(boss_attub == 0){
            boss_attack = "attack"
        }
        if(boss_attub == 1){
            boss_attack = "def"
        }
        if(boss_attub == 2){
            boss_attack = "hitback"
        }

    }



    private fun checkhp() {
        if(WL == "魔王勝"){
            worr_hp_1 = worr_hp_1-10
            worr_hp.setText(worr_hp_1.toString())

        }

        if ( WL == "勇者勝"){
            boss_hp_1 = boss_hp_1-200
            boss_hp.setText(boss_hp_1.toString())
        }


        if( worr_hp_1 <= 0){
            Toast.makeText(this,"Boss win",Toast.LENGTH_LONG).show()
            bt_atk.isEnabled = false
            bt_def.isEnabled = false
            bt_hitback.isEnabled = false
            FWL = "Boss win"
        }
        if(boss_hp_1 <= 0){
            bt_atk.isEnabled = false
            bt_def.isEnabled = false
            bt_hitback.isEnabled = false
            Toast.makeText(this,"warrior win",Toast.LENGTH_LONG).show()
            FWL = "warrior win"
        }
        WL = ""
    }
}
