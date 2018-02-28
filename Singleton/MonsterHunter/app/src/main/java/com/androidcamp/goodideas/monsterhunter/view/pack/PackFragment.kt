package com.androidcamp.goodideas.monsterhunter.view.pack

import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import android.support.v4.app.Fragment
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.PackageModel.Package
import com.androidcamp.goodideas.monsterhunter.R
import kotlinx.android.synthetic.main.fragment_pack.*

class PackFragment : Fragment() {

    // TODO: Rename and change types of parameters
    private var mParam1: String? = null
    private var mParam2: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        val view =  inflater!!.inflate(R.layout.fragment_pack, container, false)

        return view
    }


    override fun onStart() {
        super.onStart()
        Log.d("onStart", "package size: ${Package.size}")
        changeTotalCount()
        initGridView()
    }

    override fun onAttach(context: Context?) {
        super.onAttach(context)

    }

    override fun onDetach() {
        super.onDetach()
    }

    fun changeTotalCount() {
        textView_pack_amount.setText(Package.size.toString())
    }

    fun enhanceStatus(index: Int) {
        Status.hp = Status.hp + Package[index].hp
        Status.mp = Status.mp + Package[index].mp
    }

    fun initGridView() {
        val adapter = StuffAdapter(activity, Package)
        gridView_pack_stuffList.adapter = adapter

        gridView_pack_stuffList.onItemClickListener = AdapterView.OnItemClickListener { adapterView, view, index, long ->
            Log.d("PackActivity", "clicked")
            val builder = android.app.AlertDialog.Builder(activity)
            builder.setTitle("使用")
                    .setMessage("道具: ${Package[index].name}\n " +
                            "HP +${Package[index].hp}\n " +
                            "MP +${Package[index].mp}\n" +
                            "確定使用?")
                    .setPositiveButton("確定", DialogInterface.OnClickListener { dialogInterface, i ->
                        Log.d("UseStuffDialog", "確認")
                        enhanceStatus(index)    // Enhance Warrior's HP and MP
                        // Update fragment's view
                        Package.removeAt(index) // Remove item of list
                        adapter.notifyDataSetChanged()  // notify view that data has been changed
                        changeTotalCount()  // Stuff's count
                    }).setNegativeButton("取消", DialogInterface.OnClickListener { dialogInterface, i ->  })
                    .show()
        }
    }

//    companion object {
//        // TODO: Rename parameter arguments, choose names that match
//        // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
//        private val ARG_PARAM1 = "param1"
//        private val ARG_PARAM2 = "param2"
//
//        // TODO: Rename and change types and number of parameters
//        fun newInstance(param1: String, param2: String): PackFragment {
//            val fragment = PackFragment()
//            val args = Bundle()
//            args.putString(ARG_PARAM1, param1)
//            args.putString(ARG_PARAM2, param2)
//            fragment.arguments = args
//            return fragment
//        }
//    }
}// Required empty public constructor
