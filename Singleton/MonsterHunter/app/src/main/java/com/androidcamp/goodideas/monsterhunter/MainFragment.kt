package com.androidcamp.goodideas.monsterhunter

import android.content.Context
import android.net.Uri
import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
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
        ib_sword.setOnClickListener(object : View.OnClickListener {
            override fun onClick(p0: View?) {
                Status.money += 200
                Boss.hp -= Status.attack
                boss_hp.text=Boss.hp.toString()
                if(Boss.hp==0){
                    Toast.makeText(this@MainFragment.context,"You win", Toast.LENGTH_SHORT).show()
                }
            }
        })
        super.onStart()
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
