mackerel-win Cookbook
===============
mackerel-agent for windows install

Requirements
------------
platforms:windows2012R2~

Attributes
----------
TODO: List your cookbook attributes here.

#### mackerel-win::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mackerel-win']['apikey']</tt></td>
    <td>String</td>
    <td>mackerel APIKEY</td>
    <td><tt><YOUR_MACKEREL_API_KEY></tt></td>
  </tr>
  <tr>
    <td><tt>['mackerel-win']['source']</tt></td>
    <td>String</td>
    <td>mackerel msi source place</td>
    <td><tt>https://mackerel.io/file/agent/msi/mackerel-agent-latest.msi</tt></td>
  </tr>
    <tr>
    <td><tt>['mackerel-kcps-win']['scripts']</tt></td>
    <td>Array</td>
    <td>mackerel custom plugin scripts</td>
    <td><tt>%w(DiskQueueLength.ps1 NetworkTransferByte.ps1 DiskRWLatency.ps1)</tt></td>
  </tr>
</table>

Usage
-----
#### mackerel-win::default
Just include `mackerel-win::default` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mackerel-win::default]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Distributed under the [MIT License][mit].
