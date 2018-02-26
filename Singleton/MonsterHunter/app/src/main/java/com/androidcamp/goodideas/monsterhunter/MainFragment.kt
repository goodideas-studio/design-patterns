package com.androidcamp.goodideas.monsterhunter

import android.content.Context
import android.net.Uri
import android.os.Bundle
import android.support.v4.app.Fragment
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
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
        Log.d("onStart", "hp:　${Status.hp}")
        Log.d("onStart", "mp:　${Status.mp}")
        worr_hp.setText(Status.hp.toString())
        worr_mp.setText(Status.mp.toString())
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
