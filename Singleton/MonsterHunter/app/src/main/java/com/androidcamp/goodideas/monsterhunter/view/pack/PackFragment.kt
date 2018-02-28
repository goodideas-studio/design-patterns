package com.androidcamp.goodideas.monsterhunter.view.pack

import android.content.DialogInterface
import android.os.Bundle
import android.support.v4.app.Fragment
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import com.androidcamp.goodideas.monsterhunter.MainModel.Status
import com.androidcamp.goodideas.monsterhunter.model.pack.Package
import com.androidcamp.goodideas.monsterhunter.R
import com.androidcamp.goodideas.monsterhunter.presenter.pack.PackPresenter
import kotlinx.android.synthetic.main.fragment_pack.*

class PackFragment : Fragment(), PackView {
    val presenter = PackPresenter(this)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        //
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

        // retrieve package singleton and init gridView
        presenter.retrievePackage()
        // show stuff's count
        presenter.showStuffCount()
    }

    override fun setStuffCount() {
        textView_pack_amount.setText(Package.size.toString())
    }

    override fun initGridView() {
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
                        presenter.
                        enhanceStatus(index)    // Enhance Warrior's HP and MP
                        // Update fragment's view
                        Package.removeAt(index) // Remove item of list
                        adapter.notifyDataSetChanged()  // notify view that data has been changed
                        setStuffCount()  // Stuff's count
                    }).setNegativeButton("取消", DialogInterface.OnClickListener { dialogInterface, i ->  })
                    .show()
        }
    }
}
