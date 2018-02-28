package com.androidcamp.goodideas.monsterhunter

import android.os.Bundle
import android.support.v4.app.Fragment
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.animation.AlphaAnimation
import android.view.animation.Animation
import android.view.animation.AnimationUtils
import android.widget.Toast
import com.androidcamp.goodideas.monsterhunter.MainModel.Boss
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import kotlinx.android.synthetic.main.fragment_main.*



class MainFragment : Fragment() {



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        return inflater!!.inflate(R.layout.fragment_main, container, false)
    }

    override fun onStart() {
        super.onStart()
        img_sword_01.alpha = 0F


        Log.d("onStart", "hp:　${Status.hp}")
        Log.d("onStart", "mp:　${Status.mp}")
        tv_money.setText(Status.money.toString())

        // init warrior's status
        Log.d("onStart", "hp:　${Status.hp}")
        Log.d("onStart", "mp:　${Status.mp}")
        worr_hp.setText(Status.hp.toString())
        worr_mp.setText(Status.mp.toString())
        // attack
        ib_sword.setOnClickListener(object : View.OnClickListener {

            override fun onClick(p0: View?) {


                tv_money.setText(Status.money.toString())
                if(Boss.hp>0) {
                    Boss.hp -= Status.attack
                    Status.money += 1000

                    val zhangch = AnimationUtils.loadAnimation(this@MainFragment.context, R.anim.sword)
                    zhangch.setDuration(300)
                    ib_sword.startAnimation(zhangch)
                    val zhangch2 = AnimationUtils.loadAnimation(this@MainFragment.context, R.anim.boss)
                    zhangch2.setDuration(1000)
                    img_boss.startAnimation(zhangch2)
                    val sword_an :Animation= AlphaAnimation(0f,1f)

                    sword_an.duration = 1000
                    img_sword_01.startAnimation(sword_an)
                    Toast.makeText(this@MainFragment.context,"Boss HP - 100 \n money +100",Toast.LENGTH_SHORT).show()
                }else{
                    Boss.hp =0

                }
                boss_hp.text=Boss.hp.toString()
                if(Boss.hp==0){
                    Toast.makeText(this@MainFragment.context,"You win", Toast.LENGTH_SHORT).show()
                }
            }
        })
        super.onStart()
//
    }

    companion object {

//        // TODO: Rename and change types and number of parameters
//        fun newInstance(param1: String, param2: String): MainFragment {
//            val fragment = MainFragment()
//            val args = Bundle()
//            args.putString(ARG_PARAM1, param1)
//            args.putString(ARG_PARAM2, param2)
//            fragment.arguments = args
//            return fragment
//        }
    }
}// Required empty public constructor
