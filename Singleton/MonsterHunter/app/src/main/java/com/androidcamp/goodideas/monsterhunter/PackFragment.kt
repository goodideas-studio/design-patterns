package com.androidcamp.goodideas.monsterhunter

import android.annotation.SuppressLint
import android.content.Context
import android.content.DialogInterface
import android.net.Uri
import android.os.Bundle
import android.support.v4.app.Fragment
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import kotlinx.android.synthetic.main.fragment_pack.*

class PackFragment : Fragment() {

    // TODO: Rename and change types of parameters
    private var mParam1: String? = null
    private var mParam2: String? = null

    private var mListener: OnFragmentInteractionListener? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (arguments != null) {
            mParam1 = arguments.getString(ARG_PARAM1)
            mParam2 = arguments.getString(ARG_PARAM2)
        }

    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        val view =  inflater!!.inflate(R.layout.fragment_pack, container, false)

        return view
    }


    override fun onStart() {
        super.onStart()
        changeTotalCount()
        initGridView()
    }

    //    // TODO: Rename method, update argument and hook method into UI event
//    fun onButtonPressed(uri: Uri) {
//        if (mListener != null) {
//            mListener!!.onFragmentInteraction(uri)
//        }
//    }

    override fun onAttach(context: Context?) {
        super.onAttach(context)
        if (context is OnFragmentInteractionListener) {
            mListener = context
        } else {
            throw RuntimeException(context!!.toString() + " must implement OnFragmentInteractionListener")
        }
    }

    override fun onDetach() {
        super.onDetach()
        mListener = null
    }

    interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        fun onFragmentInteraction(uri: Uri)
    }

    fun changeTotalCount() {
        textView_pack_amount.setText(Package.size.toString())
    }

    fun initGridView() {
        val adapter = ImageAdapter(activity, Package)
        gridView_pack_stuffList.adapter = adapter

        gridView_pack_stuffList.onItemClickListener = AdapterView.OnItemClickListener { adapterView, view, index, long ->
            Log.d("PackActivity", "clicked")
            val builder = android.app.AlertDialog.Builder(activity)
            builder.setTitle("使用")
                    .setMessage("確定要使用此道具?")
                    .setPositiveButton("確定", DialogInterface.OnClickListener { dialogInterface, i ->
                        Log.d("UseStuffDialog", "確認")
                        Package.removeAt(index)
                        adapter.notifyDataSetChanged()
                        changeTotalCount()
                    }).setNegativeButton("取消", DialogInterface.OnClickListener { dialogInterface, i ->  })
                    .show()

        }
    }

    companion object {
        // TODO: Rename parameter arguments, choose names that match
        // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
        private val ARG_PARAM1 = "param1"
        private val ARG_PARAM2 = "param2"

        // TODO: Rename and change types and number of parameters
        fun newInstance(param1: String, param2: String): PackFragment {
            val fragment = PackFragment()
            val args = Bundle()
            args.putString(ARG_PARAM1, param1)
            args.putString(ARG_PARAM2, param2)
            fragment.arguments = args
            return fragment
        }
    }
}// Required empty public constructor
